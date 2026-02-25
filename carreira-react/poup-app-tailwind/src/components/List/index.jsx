export const List = ({ items, renderItem: ItemComponent }) => {
    return (
        <ul className="space-y-4 w-full mb-6">
            {items.map(item => (
                <li  key={item.id} className="border-neutral-header border-b border-solid last:border-0">
                    <ItemComponent item={item} />
                </li>
            ))}
        </ul>
    )
}