export class Storage {
    constructor() {
    }
    static save(key, value) {
        const valueWithString = JSON.stringify(value);
        localStorage.setItem(key, valueWithString);
    }
    static get(key, revive) {
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
