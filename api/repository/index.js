import orderRepo from "./orderRepo.js";
import userRepo from "./userRepo.js";

export default (model) => ({
  orderRepo: orderRepo(model.Order),
  userRepo: userRepo(model.User),
});
