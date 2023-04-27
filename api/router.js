export default (controlers, app) => {
  // Route Orders
  app.get("/status", controlers.statusCtrl.getStatus);
  app.get("/orders", controlers.orderCtrl.listOrders);
  app.get("/orders/:id", controlers.orderCtrl.getOrder);
  app.post("/orders", controlers.orderCtrl.createOrder);
  app.put("/orders/:id", controlers.orderCtrl.updateOrder);
  app.delete("/orders/:id", controlers.orderCtrl.deleteOrder);

  // Route users
  app.get("/users", controlers.userCtrl.listUsers);
  app.get("/users/:id", controlers.userCtrl.getUser);
  app.post("/users", controlers.userCtrl.createUser);
  app.put("/users/:id", controlers.userCtrl.updateUser);
  app.delete("/users/:id", controlers.userCtrl.deleteUser);
};
