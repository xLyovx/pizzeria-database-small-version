-- Trigger to update the amount automatically in the order table when inserting a new order
CREATE TRIGGER `order_amount_trigger` BEFORE INSERT ON `orders`
FOR EACH ROW
SET NEW.amount = NEW.quantity * (SELECT price FROM pizzas WHERE id = NEW.pizzas_id);

-- Trigger to update the amount automatically in the order table when an existing order is updated
CREATE TRIGGER `order_amount_update_trigger` BEFORE UPDATE ON `orders`
FOR EACH ROW
  SET NEW.amount = NEW.quantity * (SELECT price FROM pizzas WHERE id = NEW.pizzas_id);

-- Trigger to update the update date automatically in the order table when an existing order is updated
CREATE TRIGGER `order_updated_at_trigger` BEFORE UPDATE ON `orders`
FOR EACH ROW
SET NEW.updated_at = CURRENT_TIMESTAMP;
