export class Storage
{
    private constructor() {
    }

    public static save(key: string, value: any)
    {
        const valueWithString = JSON.stringify(value);

        localStorage.setItem(key, valueWithString);
    }

    public static get(key:string, revive?: (this: any, key: string, value: any) => any)
    {
        const value = localStorage.getItem(key);

        if (value === null) {
            return null;
        }

        if (revive) {
            return JSON.parse(value, revive);
        }

        return JSON.parse(value);
    }
}