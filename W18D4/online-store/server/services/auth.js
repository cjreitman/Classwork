const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const keys = require("../../config/keys");

// here we'll be taking in the `data` from our mutation
const validateRegisterInput = require("../validation/register");
const validateLoginInput = require("../validation/login");

const register = async data => {
  try {
    const { message, isValid } = validateRegisterInput(data);

    if (!isValid) {
      throw new Error(message);
    }

    const { name, email, password } = data;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
      throw new Error("This user already exists");
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = new User(
      {
        name,
        email,
        password: hashedPassword
      },
      err => {
        if (err) throw err;
      }
    );

    user.save();
    // we'll create a token for the user
    const token = jwt.sign({ id: user._id }, keys.secretOrKey);

    // then return our created token, set loggedIn to be true, null their password, and send the rest of the user
    return { token, loggedIn: true, ...user._doc, password: null };
  } catch (err) {
    throw err;
  }
};

const logout = async data => {
  try {
    // take in our data and deconstruct the _id
    const { _id } = data;

    //wait for our user to come back
    const user = await User.findById(_id);
    if (!user) throw new Error("This user does not exist");

    const token = "";
    // blank our the user's token and set loggedIn to false
    return { token, loggedIn: false, ...user._doc, password: null };
  } catch (err) {
    throw err;
  }
};

const login = async data => {
  try {
    const { message, isValid } = validateLoginInput(data);

    if (!isValid) {
      throw new Error(message);
    }

    const { email, password } = data;

    const user = await User.findOne({ email });
    if (!user) throw new Error("This user does not exist");

    const isValidPassword = await bcrypt.compareSync(password, user.password);
    if (!isValidPassword) throw new Error("Invalid password");

    const token = jwt.sign({ id: user.id }, keys.secretOrKey);

    return { token, loggedIn: true, ...user._doc, password: null };
  } catch (err) {
    throw err;
  }
}; 

const verifyUser = async data => {
  try {
    const { token } = data;
    const decoded = jwt.verify(token, keys.secretOrKey);
    const { id } = decoded;
    console.log(`user id: ${id}`, keys.secretOrKey, token);
    const loggedIn = await User.findById(id).then(user => {
      console.log(`user: ${user}`);
      return user ? true : false;
    });

    console.log(loggedIn);

    return { loggedIn };
  } catch (err) {
    return { loggedIn: false };
  }
};

module.exports = { register, logout, login, verifyUser };