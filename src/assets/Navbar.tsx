import React from "react";
import logo from "../logo.jpg"
const Navbar = () => {
  return (
    <div>
      <nav className="Navbar_Home">
        <a className="navbar-Medio" href="#">
          <img
            src={logo}
            alt="Logo"
            width="40"
            height="35"
            className="d-inline-block align-text-top"
          />
          Medio
        </a>
        <button type="button" className="btn btn-primary button-LogIn">Log In</button>
        <button type="button" className="btn btn-primary button-SignIn">Sign In</button>
      </nav>
    </div>
  );
};

export default Navbar;
