import { v4 as uuidv4 } from "uuid";

export default (User) => {
  const users = [
    new User(
      "635a9999-582e-49ac-b1f3-3305196ddea1",
      "POM",
      "Axel",
      "2000-04-09",
      "2 rue du lila",
      "+337834929",
      "axel@gmail.com"
    ),
    new User(
      "5bf928f5-ab86-4dc9-b670-28935e348ad3",
      "HENRY",
      "Marc",
      "2003-04-09",
      "24 passage",
      "+337832767",
      "marc@gmail.com"
    ),
  ];

  const findUser = (id) => {
    return users.find((user) => user.id === id);
  };

  const listUsers = () => {
    return users;
  };

  const createUser = (userData) => {
    const user = new User(
      uuidv4(),
      userData.lastName,
      userData.firstName,
      userData.birthDate,
      userData.address,
      userData.phone,
      userData.email
    );

    users.push(user);
    return user;
  };

  const updateUser = (id, userData) => {
    let foundUserIdx = -1;
    users.forEach((user, idx) => {
      if (user.id === id) {
        foundUserIdx = idx;
      }
    });

    if (foundUserIdx > -1) {
      users[foundUserIdx] = Object.assign(users[foundUserIdx], userData);
      return users[foundUserIdx];
    }

    return null;
  };

  const deleteUser = (id) => {
    let userToDeleteIndex = users.findIndex((b) => b.id === id);

    if (userToDeleteIndex > -1) {
      let deletedUser = users.splice(userToDeleteIndex, 1)[0];
      return deletedUser;
    }

    return null;
  };

  return {
    listUsers,
    findUser,
    createUser,
    updateUser,
    deleteUser,
  };
};
