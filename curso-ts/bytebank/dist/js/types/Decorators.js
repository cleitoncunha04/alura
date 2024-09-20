export function ValidateDebit(target, propertyKey, descriptor) {
    const originalMethod = descriptor.value;
    descriptor.value = function (debitValue) {
        if (debitValue <= 0) {
            throw new Error("The amount MUST be greater than 0!");
        }
        else if (debitValue > this.balance) {
            throw new Error("Insufficient balance");
        }
        return originalMethod.apply(this, [debitValue]);
    };
    return descriptor;
}
export function ValidateDeposit(target, propertyKey, descriptor) {
    const originalMethod = descriptor.value;
    descriptor.value = function (depositValue) {
        if (depositValue <= 0) {
            throw new Error("The amount must be greater than 0");
        }
        return originalMethod.apply(this, [depositValue]);
    };
    return descriptor;
}
