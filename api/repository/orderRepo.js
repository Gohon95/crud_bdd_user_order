import { v4 as uuidv4 } from "uuid";

export default (Order) => {
  const orders = [
    new Order(
      "dd23a206-7312-4974-a60e-5d6082c770b6",
      "2000-08-07",
      "53126898-3f0d-4bda-88b1-41070cf0468d",
      "13",
      "635a9999-582e-49ac-b1f3-3305196ddea1"
    ),
    new Order(
      "61d7c9d4-f239-42b3-ac5a-225ad5013281",
      "2001-08-07",
      "ccf1b79a-8f2a-4e1d-9b8c-34c50716cb8e",
      "19",
      "5bf928f5-ab86-4dc9-b670-28935e348ad3"
    ),
  ];

  const findOrder = (id) => {
    return orders.find((order) => order.id === id);
  };

  const listOrders = () => {
    return orders;
  };

  const createOrder = (orderData) => {
    const order = new Order(
      uuidv4(),
      orderData.orderDate,
      orderData.recipeId,
      orderData.quantity,
      orderData.userId
    );

    orders.push(order);
    return order;
  };

  const updateOrder = (id, orderData) => {
    let foundOrderIdx = -1;
    orders.forEach((order, idx) => {
      if (order.id === id) {
        foundOrderIdx = idx;
      }
    });

    if (foundOrderIdx > -1) {
      orders[foundOrderIdx] = Object.assign(orders[foundOrderIdx], orderData);
      return orders[foundOrderIdx];
    }

    return null;
  };

  const deleteOrder = (id) => {
    let orderToDeleteIndex = orders.findIndex((b) => b.id === id);

    if (orderToDeleteIndex > -1) {
      let deletedOrder = orders.splice(orderToDeleteIndex, 1)[0];
      return deletedOrder;
    }

    return null;
  };

  return {
    listOrders,
    findOrder,
    createOrder,
    updateOrder,
    deleteOrder,
  };
};
