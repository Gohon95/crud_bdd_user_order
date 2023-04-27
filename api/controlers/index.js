import statusCtrl from "./statusCtrl.js";
import orderCtrl from "./orderCtrl.js";
import userCtrl from "./userCtrl.js";

export default (repository) => ({
  statusCtrl,
  orderCtrl: orderCtrl(repository.orderRepo),
  userCtrl: userCtrl(repository.userRepo),
});
