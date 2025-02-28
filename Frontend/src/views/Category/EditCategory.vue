<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Edit Category</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-3"></div>
      <div class="col-md-6 px-5 px-md-0">
        <form v-if="category">
          <div class="form-group">
            <label>Category Name</label>
            <input type="text" class="form-control" v-model="category.categoryName" required>
          </div>
          <div class="form-group">
            <label>Description</label>
            <input type="text" class="form-control" v-model="category.description" required>
          </div>
          <div class="form-group">
            <label>ImageURL</label>
            <input type="url" class="form-control" v-model="category.imageUrl" required>
          </div>
          <button type="button" class="btn btn-primary" @click="editCategory">Submit</button>
        </form>
      </div>
      <div class="col-3"></div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'; 
import swal from 'sweetalert2';

export default {
  data() {
    return {
      category: null,
      categoryId: null // New data property for categoryId
    }
  },
  props: ["baseURL", "categories"],
  methods: {
    async editCategory() {
      // Clone the category to avoid direct mutation
      const categoryToUpdate = { ...this.category };
      delete categoryToUpdate["products"];

      await axios.post(this.baseURL + "category/update/" + this.categoryId, categoryToUpdate)
      .then(() => { // Removed the 'res' variable
        // Sending the event to parent to handle
        this.$emit("fetchData");
        this.$router.push({ name: 'AdminCategory' });
        swal({
          text: "Category Updated Successfully!",
          icon: "success",
          closeOnClickOutside: false,
        });
      })
      .catch(err => console.log(err));
    }
  },
  mounted() {
    if (!localStorage.getItem('token')) {
      this.$router.push({ name: 'Signin' });
      return;
    }
    this.categoryId = this.$route.params.id; // Use the new data property
    this.category = this.categories.find(category => category.id == this.categoryId);
    console.log('category', this.category);
  }
}
</script>



<style scoped>
h4 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}
</style>
