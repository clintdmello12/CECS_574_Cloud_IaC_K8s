<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <router-link class="navbar-brand" :to="{ name: 'Home' }">
      <img src="../assets/icon.png" alt="CSGEEK SHOPS" height="40" />
    </router-link>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <form class="form-inline my-2 my-lg-0 w-100">
        <input class="form-control mr-sm-2 flex-grow-1" type="search" placeholder="Search Items" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>

      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Browse
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <router-link class="dropdown-item" :to="{ name: 'Home' }">Home</router-link>
            <router-link class="dropdown-item" :to="{ name: 'Product' }">Product</router-link>
            <router-link class="dropdown-item" :to="{ name: 'Category' }">Category</router-link>
          </div>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownAccountLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Accounts
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownAccountLink">
            <router-link class="dropdown-item" :to="{ name: 'Wishlist' }">Wishlist</router-link>
            <router-link class="dropdown-item" :to="{ name: 'Admin' }">Admin</router-link>
            <a class="dropdown-item" href="#" @click="signout">Sign Out</a>
          </div>
        </li>

        <li class="nav-item">
          <router-link class="nav-link" :to="{ name: 'Order' }">
            Orders
          </router-link>
        </li>

        <li class="nav-item">
          <router-link class="nav-link" :to="{ name: 'Cart' }">
            <i class="fa fa-shopping-cart"></i>
            <span class="badge badge-danger">{{ cartCount }}</span>
          </router-link>
        </li>
      </ul>
    </div>
  </nav>
</template>


<script>
import swal from 'sweetalert2';
export default {
  name: "Navbar",
  props: ["cartCount"],
  data() {
    return {
      token: null,
    };
  },
  methods: {
    signout() {
      localStorage.removeItem("token");
      this.token = null;
      this.$emit("resetCartCount");
      this.$router.push({ name: "Home" });
      swal.fire({
        text: "Logged you out. Visit Again",
        icon: "success",
        closeOnClickOutside: false,
      });
    },
  },
  mounted() {
    this.token = localStorage.getItem("token");
  },
};
</script>

<style scoped>
.navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.5rem 2rem;
  background-color: #333;
  color: #fff;
}

.navbar-brand img {
  height: 50px; /* Adjust as necessary */
}

.search-container {
  display: flex;
  align-items: center;
}

.search-input {
  padding: 0.5rem;
  border: none;
  border-radius: 2rem;
  margin-right: -2.5rem;
}

.search-btn {
  background-color: #8bc53f;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 2rem;
  cursor: pointer;
}

.nav-links .nav-item {
  color: #fff;
  text-decoration: none;
  margin: 0 1rem;
  position: relative;
}

.user-cart {
  display: flex;
  align-items: center;
}

.cart-icon {
  display: flex;
  align-items: center;
  position: relative;
  color: #fff;
  text-decoration: none;
}

.cart-icon .fa-shopping-cart {
  font-size: 1.5rem;
}

#nav-cart-count {
  position: absolute;
  top: -10px;
  right: -10px;
  background-color: red;
  color: white;
  border-radius: 50%;
  padding: 0.25rem;
  font-size: 0.75rem;
  min-width: 20px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* Extended Search Bar */
.search-form {
  width: 100%;
  max-width: 600px; /* Adjust the max-width as needed */
}

.search-input {
  width: 85%;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
}

.search-button {
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
}

/* Responsive adjustments */
@media (max-width: 991px) {
  .search-form {
    max-width: none;
    width: auto;
  }

  .search-input {
    width: 100%;
  }
}

.navbar {
  padding: 0.5rem 1rem;
}

.form-inline {
  display: flex;
  flex-grow: 1;
  margin: 0 1rem;
}

.form-control {
  flex-grow: 1;
  margin-right: .5rem;
}

.btn-outline-success {
  white-space: nowrap;
}

.badge {
  position: absolute;
  top: 9px;
  right: 6px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}

.fa-shopping-cart {
  position: relative;
}

.navbar {
  background-color: #EAEDED; 
}


.cart-icon {
  font-size: 1.8em; 
  position: relative;
  cursor: pointer;
  transition: transform 0.2s ease; 
}

.cart-icon:hover {
  transform: scale(1.1); 
}


.cart-badge {
  position: absolute;
  top: -10px; 
  right: -10px;
  background-color: red;
  color: white;
  border-radius: 50%;
  padding: 0.2em 0.5em;
  font-size: 0.7em;
  
  transition: transform 0.2s ease;
}

.cart-badge:hover {
  transform: scale(1.1); 
}


.navbar .navbar-nav .nav-link {
  transition: color 0.2s ease; 
}

.navbar .navbar-nav .nav-link:hover {
  color: #28a745; 
}


.dropdown-menu a.dropdown-item:hover {
  background-color: #28a745;
  color: white;
}

.search-button {
  transition: background-color 0.2s ease; /* Transition for background color */
}

.search-button:hover {
  background-color: #5cb85c; /* Slightly darker green for the search button */
}


.navbar-button, .search-input {
  transition: all 0.2s ease; 
}

.navbar-button:hover {
  background-color: #565656; 
}

.search-input:hover {
  border-color: #ccc; 
}
</style>
