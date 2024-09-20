export class Storage {
    private constructor() {
    }

    static save(key: string, value: any) {
        const valueWithString = JSON.stringify(value);

        localStorage.setItem(key, valueWithString);
    }

    static get<T>(key: string, revive?: (this: any, key: string, value: any) => any): T | null {
        const value = localStorage.getItem(key);

        if (value === null) {
            return null;
        }

        if (revive) {
            return JSON.parse(value, revive) as T;
        }

        return JSON.parse(value) as T;
    }
}