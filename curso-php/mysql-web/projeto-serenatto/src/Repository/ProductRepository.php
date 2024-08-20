<?php

namespace Vendor\Serenatto\Repository;


use InvalidArgumentException;
use PDO;
use PDOStatement;
use Vendor\Serenatto\Model\Product;
use Vendor\Serenatto\Model\Repository;

class ProductRepository implements Repository
{

    public function __construct(
        public readonly PDO $connection
    ) {
    }

    private function validateProduct($object): void
    {
        if (!$object instanceof Product) {
            throw new InvalidArgumentException('O objeto deve ser uma instância de Product');
        }
    }

    private function prepareStatement(string $query): PDOStatement
    {
        return $this->connection->prepare($query);
    }

    /**
    * @return Product[]
    */
    private function hydrateProduct(PDOStatement $statement): array
    {
        //crio
        return array_map(function ($product) {
            return new Product(
                id: $product['id'],
                type: $product['tipo'],
                name: $product['nome'],
                description: $product['descricao'],
                image: $product['imagem'],
                price: $product['preco'],
            );
        },  $statement->fetchAll());
    }

    public function findAll(): array
    {
        $statement = $this->prepareStatement("
            SELECT * FROM produtos ORDER BY preco
        ");

        $statement->execute();

        return $this->hydrateProduct($statement);
    }

    public function findByType(string $type): array
    {
        $statement = $this->prepareStatement("
            SELECT * FROM produtos 
            WHERE tipo = :type ORDER BY preco
        ");

        $statement->execute([':type' => $type]);

        return $this->hydrateProduct($statement);
    }

    private function addProduct(object $product): bool
    {
        $statement = $this->prepareStatement('
            INSERT INTO 
                produtos(id, tipo, nome, descricao, imagem, preco) 
            VALUES(:id, :type, :name, :description, :image, :price)
        ');

        return $statement->execute([
            ':id' => $product->id,
            ':type' => $product->type,
            ':name' => $product->name,
            ':description' => $product->description,
            ':image' => $product->image,
            ':price' => $product->price
        ]);
    }

    private function updateProduct(object $product): bool
    {
        $statement = $this->prepareStatement('
            UPDATE produtos
            SET 
                tipo = :type,
                nome = :name,
                descricao = :description,
                imagem = :image,
                preco = :price
            WHERE 
                id = :id;
        ');

        return $statement->execute([
            ':id' => $product->id,
            ':type' => $product->type,
            ':name' => $product->name,
            ':description' => $product->description,
            ':image' => $product->image,
            ':price' => $product->price
        ]);
    }

    public function save(object $object): bool
    {
        $this->validateProduct($object);

        if ($object->id !== null) {
            return $this->updateProduct($object);
        } else {
            return $this->addProduct($object);
        }
    }

    public function delete(object $object): bool
    {
        $this->validateProduct($object);

        $statement = $this->prepareStatement('DELETE FROM produtos WHERE id = :id');

        return $statement->execute([':id' => $object->id]);
    }
}