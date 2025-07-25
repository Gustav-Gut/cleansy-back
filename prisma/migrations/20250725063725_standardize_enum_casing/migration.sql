/*
  Warnings:

  - The values [flat,house,office] on the enum `CustomerHouseType` will be removed. If these variants are still used in the database, this will fail.
  - The values [active,suspended] on the enum `CustomerStatus` will be removed. If these variants are still used in the database, this will fail.
  - The values [contract,id_card,resume,background_check,support_document] on the enum `DocumentType` will be removed. If these variants are still used in the database, this will fail.
  - The values [housemaid,customer,service] on the enum `EvaluatedEntityType` will be removed. If these variants are still used in the database, this will fail.
  - The values [customer_review,housemaid_review] on the enum `EvaluationsType` will be removed. If these variants are still used in the database, this will fail.
  - The values [active,suspended,fired,medical_leave,vacation,training] on the enum `HousemaidStatus` will be removed. If these variants are still used in the database, this will fail.
  - The values [scheduled,in_progress,suspended,finished,canceled] on the enum `ServiceStatus` will be removed. If these variants are still used in the database, this will fail.
  - The values [new,in_progress,closed] on the enum `SupportStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- Renombrar valores para CustomerStatus
ALTER TYPE "CustomerStatus" RENAME VALUE 'active' TO 'ACTIVE';
ALTER TYPE "CustomerStatus" RENAME VALUE 'suspended' TO 'SUSPENDED';

-- Renombrar valores para CustomerHouseType
ALTER TYPE "CustomerHouseType" RENAME VALUE 'flat' TO 'FLAT';
ALTER TYPE "CustomerHouseType" RENAME VALUE 'house' TO 'HOUSE';
ALTER TYPE "CustomerHouseType" RENAME VALUE 'office' TO 'OFFICE';

-- Renombrar valores para HousemaidStatus
ALTER TYPE "HousemaidStatus" RENAME VALUE 'active' TO 'ACTIVE';
ALTER TYPE "HousemaidStatus" RENAME VALUE 'suspended' TO 'SUSPENDED';
ALTER TYPE "HousemaidStatus" RENAME VALUE 'fired' TO 'FIRED';
ALTER TYPE "HousemaidStatus" RENAME VALUE 'medical_leave' TO 'MEDICAL_LEAVE';
ALTER TYPE "HousemaidStatus" RENAME VALUE 'vacation' TO 'VACATION';
ALTER TYPE "HousemaidStatus" RENAME VALUE 'training' TO 'TRAINING';

-- Renombrar valores para ServiceStatus
ALTER TYPE "ServiceStatus" RENAME VALUE 'scheduled' TO 'SCHEDULED';
ALTER TYPE "ServiceStatus" RENAME VALUE 'in_progress' TO 'IN_PROGRESS';
ALTER TYPE "ServiceStatus" RENAME VALUE 'suspended' TO 'SUSPENDED';
ALTER TYPE "ServiceStatus" RENAME VALUE 'finished' TO 'FINISHED';
ALTER TYPE "ServiceStatus" RENAME VALUE 'canceled' TO 'CANCELED';

-- Renombrar valores para EvaluationsType
ALTER TYPE "EvaluationsType" RENAME VALUE 'customer_review' TO 'CUSTOMER_REVIEW';
ALTER TYPE "EvaluationsType" RENAME VALUE 'housemaid_review' TO 'HOUSEMAID_REVIEW';

-- Renombrar valores para EvaluatedEntityType
ALTER TYPE "EvaluatedEntityType" RENAME VALUE 'housemaid' TO 'HOUSEMAID';
ALTER TYPE "EvaluatedEntityType" RENAME VALUE 'customer' TO 'CUSTOMER';
ALTER TYPE "EvaluatedEntityType" RENAME VALUE 'service' TO 'SERVICE';

-- Renombrar valores para DocumentType
ALTER TYPE "DocumentType" RENAME VALUE 'contract' TO 'CONTRACT';
ALTER TYPE "DocumentType" RENAME VALUE 'id_card' TO 'ID_CARD';
ALTER TYPE "DocumentType" RENAME VALUE 'resume' TO 'RESUME';
ALTER TYPE "DocumentType" RENAME VALUE 'background_check' TO 'BACKGROUND_CHECK';
ALTER TYPE "DocumentType" RENAME VALUE 'support_document' TO 'SUPPORT_DOCUMENT';

-- Renombrar valores para SupportStatus
ALTER TYPE "SupportStatus" RENAME VALUE 'new' TO 'NEW';
ALTER TYPE "SupportStatus" RENAME VALUE 'in_progress' TO 'IN_PROGRESS';
ALTER TYPE "SupportStatus" RENAME VALUE 'closed' TO 'CLOSED';