export default (orderRepo) => {
  const listOrders = (_, res) => {
    res.send({
      data: orderRepo.listOrders(),
    });
  };

  const getOrder = (req, res) => {
    const id = req.params.id;
    const order = orderRepo.findOrder(id);

    if (order) {
      return res.send({
        data: order,
      });
    }

    res.status(404).send({
      error: `Order with id ${id} not found`,
    });
  };

  const createOrder = (req, res) => {
    const order = orderRepo.createOrder(req.body);
    res.status(201).send({
      data: order,
    });
  };

  const updateOrder = (req, res) => {
    const id = req.params.id;
    const order = orderRepo.updateOrder(id, req.body);

    if (order) {
      return res.send({
        data: order,
      });
    }

    res.status(404).send({
      error: `Order with id ${id} not found`,
    });
  };

  const deleteOrder = (req, res) => {
    const id = req.params.id;
    const deletedOrder = orderRepo.deleteOrder(id);

    if (deletedOrder) {
      return res.send({
        meta: {
          deleted: deletedOrder,
        },
      });
    }

    res.status(404).send({
      error: `Order with id ${id} not found`,
    });
  };

  return {
    listOrders,
    getOrder,
    createOrder,
    updateOrder,
    deleteOrder,
  };
};
