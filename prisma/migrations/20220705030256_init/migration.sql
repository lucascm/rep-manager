-- CreateTable
CREATE TABLE `Billing` (
    `id` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `status` ENUM('OPENED', 'PROCESSING', 'ABORTED', 'CLOSED') NOT NULL DEFAULT 'OPENED',
    `details` JSON NOT NULL,
    `personId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id` VARCHAR(191) NOT NULL,
    `alternativeCode` VARCHAR(191) NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `price` DECIMAL(65, 30) NOT NULL,
    `stock` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Person` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `document` VARCHAR(191) NOT NULL,
    `pathPhoto` VARCHAR(191) NULL,
    `type` ENUM('REPRESENTANT', 'MANAGER', 'CLIENT') NOT NULL DEFAULT 'REPRESENTANT',
    `details` JSON NOT NULL,
    `status` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Billing` ADD CONSTRAINT `Billing_personId_fkey` FOREIGN KEY (`personId`) REFERENCES `Person`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
