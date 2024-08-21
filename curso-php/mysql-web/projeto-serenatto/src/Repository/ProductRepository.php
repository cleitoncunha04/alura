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
    )
    {
    }

    private function prepareStatement(string $query): PDOStatement
    {
        return $this->connection->prepare($query);
    }

    /**
     * @return Product[]
     */
    private function hydrateProducts(PDOStatement $statement): array
    {
        //cria uma cópia do array associativo em um array de Product
        return array_map(function ($product) {
            return new Product(
                id: $product['id'],
                type: $product['tipo'],
                name: $product['nome'],
                description: $product['descricao'],
                price: $product['preco'],
                image: $product['imagem'],
            );
        }, $statement->fetchAll());
    }

    public function findAll(): array
    {
        $statement = $this->prepareStatement("
            SELECT * FROM produtos ORDER BY preco
        ");

        $statement->execute();

        return $this->hydrateProducts($statement);
    }

    public function findById(int $id): array
    {
        $statement = $this->prepareStatement("SELECT * FROM produtos WHERE id = :id");

        $statement->bindParam(":id", $id, PDO::PARAM_INT);

        $statement->execute();

        return $this->hydrateProducts($statement);
    }

    public function findByType(string $type): array
    {
        $statement = $this->prepareStatement("
            SELECT * FROM produtos 
            WHERE tipo = :type ORDER BY preco
        ");

        $statement->execute([':type' => $type]);

        return $this->hydrateProducts($statement);
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
            ':image' => $product->getImage(),
            ':price' => $product->price
        ]);
    }

    private function updateImageProduct(object $product): bool
    {
        return $this->prepareStatement("
            UPDATE produtos 
            SET 
                imagem = :image 
            WHERE id = :id
            ")->execute([
            ':image' => $product->getImage(),
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
                preco = :price
            WHERE 
                id = :id;
        ');

        if($product->getImage() !== "logo-serenatto.png") {
            $this->updateImageProduct($product);
        }

        return $statement->execute([
            ':id' => $product->id,
            ':type' => $product->type,
            ':name' => $product->name,
            ':description' => $product->description,
            ':price' => $product->price
        ]);
    }

    public function save(object $object): bool
    {
        if (!$object instanceof Product) {
            throw new InvalidArgumentException('O objeto deve ser uma instância de Product');
        } else {
            if ($object->id !== null) {
                return $this->updateProduct($object);
            } else {
                return $this->addProduct($object);
            }
        }
    }

    public function delete(int $id): bool
    {
        $statement = $this->prepareStatement('DELETE FROM produtos WHERE id = :id');

        $statement->bindParam(':id', $id, PDO::PARAM_INT);

        return $statement->execute();
    }
}