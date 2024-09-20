export function ValidateDebit(target: any, propertyKey: string, descriptor: PropertyDescriptor)
{
    const originalMethod = descriptor.value;

    descriptor.value = function (debitValue: number) {
        if (debitValue <= 0) {
            throw new Error("The amount MUST be greater than 0!");
        } else if (debitValue > this.balance) {
            throw new Error ("Insufficient balance");
        }

        return originalMethod.apply(this, [debitValue]);
    }

    return descriptor;
}

export function ValidateDeposit(target: any, propertyKey: string, descriptor: PropertyDescriptor)
{
    const originalMethod = descriptor.value;

    descriptor.value = function (depositValue: number) {
        if (depositValue <= 0) {
            throw new Error("The amount must be greater than 0");
        }

        return originalMethod.apply(this, [depositValue]);
    }

    return descriptor;
}