/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      currentUser: null
    };
  },
  created: function() {
  },
  methods: {},
  computed: {}
};

var AboutPage = {
  template: "#about-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
    };
  },
  created: function() {
  },
  methods: {},
  computed: {}
};

var ContactPage = {
  template: "#contact-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
    };
  },
  created: function() {
  },
  methods: {},
  computed: {}
};

var ProfilePage = {
  template: "#profile-page",
  data: function() {
    return {
      currentUser: null,
      errors: []
    };
  },
  created: function() {
      axios
        .get("/users")
        .then(function(response) {
          console.log(response.data);
          this.currentUser = response.data.current_user;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    

  },
  methods: {},
  computed: {}
};

var RequirementPage = {
  template: "#requirement-page",
  data: function() {
    return {
      currentUser: {username: "Loading"},
      allergy: "Dairy",
      diet: "Vegetarian",
      mealType: "Main Dishes",
      requirementList: [],
      reqID: 1,
      errors: []
    };
  },
  created: function() {
      this.updateUser();
      axios.get("/requirements")
        .then(function(response) {
          console.log(response.data);
          this.requirementList = response.data;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    

  },
  methods: {
    updateUser: function(){
      axios
        .get("/users")
        .then(function(response) {
          console.log(response.data);
          this.currentUser = response.data.current_user;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
      add_requirement: function(id) {
      console.log("ID: "+id);
      var params = {
        requirement_id: id,
        user_id: this.currentUser.id
      };
      axios
        .post("/user_requirements", params)
        .then(function(response) {
          console.log("Requirement Added");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );

        this.updateUser();
    }

  },
  computed: {}
};


var PastMealPage = {
  template: "#past-meal-page",
  data: function() {
    return {
      currentUser: {username: "Loading"},
      mealName: "",
      k: 0.0,
      na: 0.0,
      chole: 0.0,
      fatrn: 0.0,
      fasat: 0.0,
      chocdf: 0.0,
      fibtg: 0.0,
      procnt: 0.0,
      vitc: 0.0,
      ca: 0.0,
      fe: 0.0,
      sugar: 0.0,
      enerc_kcal: 0.0,
      fat: 0.0,
      vita_iu: 0.0,
      errors: []
    };
  },
  created: function() {
      this.updateUser();
  },
  methods: {
    updateUser: function(){
      axios
        .get("/users")
        .then(function(response) {
          console.log(response.data);
          this.currentUser = response.data.current_user;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
    createNewPastMeal: function(){
      var params = {k: this.k, na: this.na, chole: this.chole,  fatrn: this.fatrn, fasat: this.fasat, chocdf: this.chocdf, fibtg: this.fibtg, pronct: this.pronct, vitc: this.vitc, ca: this.ca, fe: this.fe, sugar: this.sugar, enerc_kcal: this.enerc_kcal, fat: this.fat, vita_iu: this.vita_iu, name: this.mealName};

        axios
        .post("/past_meals", params)
        .then(function(response) {
          axios.get("/past_meals")
            .then(function(response) {
              console.log(response.data);
            }.bind(this)
            ).catch(
              function(error) {
                this.errors = error.response.data.errors;
              }.bind(this)
            );

        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
        this.updateUser();
    }
  },
  computed: {}
};

var RecipePage = {
  template: "#recipe-page",
  data: function() {
    return {
      currentUser: {username: "Loading", recipes: []},
      mealName: "",
      recipes: {},
      pastMeals: [],
      nutritionalData: {
       
      },
      userNData: {
        k: 0.0,
        na: 0.0,
        chole: 0.0,
        fatrn: 0.0,
        fasat: 0.0,
        chocdf: 0.0,
        fibtg: 0.0,
        procnt: 0.0,
        vitc: 0.0,
        ca: 0.0,
        fe: 0.0,
        sugar: 0.0,
        enerc_kcal: 0.0,
        fat: 0.0,
        vita_iu: 0.0,
      },
      errors: []
    };
  },
  created: function() {
        axios
        .get("/users")
        .then(function(response) {
          console.log(response.data);
          this.currentUser = response.data.current_user;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );

        // axios.get("/recipes")
        //   .then(function(response) {
        //     console.log(response.data);
        //     this.recipes = response.data;
        //   }.bind(this)
        //   ).catch(
        //     function(error) {
        //       this.errors = error.response.data.errors;
        //     }.bind(this)
        //   );

           //Get Nutrtional Data
      axios
        .get("/nutritional_data")
        .then(function(response) {
          console.log(response.data);
          //Age (Todo) and Gender selection
          if(this.currentUser.gender === "m"){
            this.nutritionalData = response.data[0];
          }else{
            this.nutritionalData = response.data[1];
          }
          console.log("Axios N Data Baseline");
          console.log(this.nutritionalData);
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );

    

  },
  methods: {
    generateRandomSeed: function(APICall){
      var seed = Math.floor(Math.random()*Math.floor(20));
      var api = APICall;
      api += "&maxResult=1&start=" + seed;
      console.log(api)
      return api;
    },
    createRecipe: function(params){
      var recipeParams = {
        name: params.matches[0].recipeName,
        yumID: params.matches[0].id,
        image_url: params.matches[0].smallImageUrls[0]
      }
      axios
          .post("/recipes",recipeParams)
          .then(function(response) {
            console.log("Recipe Created")
            console.log(response.data);
          }.bind(this)
          ).catch(
            function(error) {
              this.errors = error.response.data.errors;
            }.bind(this)
          );

    },
    sortNumber: function(a,b) {
    return a - b;
    },
    sortNutrtionalDebt: function(userNData, modifier,){
      var debtValues = [];
      var nKeys = {};
      for (var key in userNData){
        var recommended = this.nutritionalData[key];
        var current = userNData[key] * modifier
        var debt = recommended - current;
        if(debt > 0){
          debtValues.push(debt);
          nKeys[debt] = key;
        }
      }
      console.log("Pre Sorted DebtValues");
      console.log(debtValues);

      debtValues = debtValues.sort(this.sortNumber);
      var ret = {};
      //Logic: If seed > 2* length add top two debts and random other. If seed > length add top debt and random other. Otherwise add random debt.
      console.log("DebtValues");
      console.log(debtValues);

      var length = debtValues.length;
      var seed = Math.floor(Math.random()*Math.floor(length * 3));
      if (seed > length*2) {
        ret[nKeys[debtValues[length-2]]] = debtValues[length-2];
        console.log("seed>length*2");
        console.log(nKeys[debtValues[length-2]]);
      }
      if (seed > length){
        ret[nKeys[debtValues[length-1]]] = debtValues[length-1];
        console.log("seed>length");
        console.log(nKeys[debtValues[length-1]]);
      }

      var keySeed = Math.floor(Math.random()*Math.floor(length));
      ret[nKeys[debtValues[keySeed]]] = debtValues[keySeed];
      console.log(nKeys[debtValues[keySeed]]);

      
      console.log(nKeys);
      console.log("Seed: " + seed + " Length: " + length);
      console.log("Key Seed: " + keySeed);
      console.log("Return value");
      console.log(ret);
      return ret;




    },
    generate_recipe: function(){
      //API Example Call: http://api.yummly.com/v1/api/recipes?_app_id=46598055&_app_key=3c7da548f3efa79721643dd19d25e1da&q=onion+soup&allowedCourse[]=course^course-Appetizers
      var appID = "46598055";
      var appKEY = "3c7da548f3efa79721643dd19d25e1da";
      var APICall = "http://api.yummly.com/v1/api/recipes?_app_id="+appID + "&_app_key=" + appKEY;

      //Nutritional Requirements
      //Get all past meal requirements. 
      //Get nutritional data needed
      //Calculate the percent of daily food inputted (Calorie based)
      // Any nutritional requirement that they are missing (50% or lower) add to the API call
   
      //Aggregate Past Meal Data
      var modifier = 1;
      for (var i = 0; i < this.currentUser.past_meals.length; i++) {
        for (var key in this.currentUser.past_meals[0]) {
          this.userNData[key] += this.currentUser.past_meals[i][key];
        }
      }
      modifier = this.nutritionalData["enerc_kcal"]/this.userNData["enerc_kcal"];
      console.log("Modifier: " + modifier);
      console.log("NData: ");
      console.log(this.userNData);
      var sortedKeys = this.sortNutrtionalDebt(this.userNData, modifier)
      //Most needed nutritional
        var mostNeededKey = "na";
        var highestDebt = 0;

        for (var key in this.userNData){
          var recommended = this.nutritionalData[key];
          var current = this.userNData[key] * modifier
          var debt = recommended - current;
          if (debt > highestDebt && debt > 0) {
            highestDebt = 0;
            mostNeededKey = key;
          }
        }

        var recommended = this.nutritionalData[mostNeededKey];
        var current = this.userNData[mostNeededKey] * modifier

        min = (recommended-current)/4;
        if(min < 0){
          min = 0;
        }
        max = (recommended-(current/modifier));
        APICall += "&nutrition." + mostNeededKey.toUpperCase() +".min="+min+"&nutrition." + mostNeededKey.toUpperCase() + ".max="+max;
        //add search_term to query


      // if(this.currentUser.past_meals != null){
      //   this.pastMeals = this.currentUser.past_meals;
        
      //   for (var i = 0; i < this.pastMeals.length; i++) {
      //     for (var key in this.pastMeals[0]) {
      //       // Adjust to 2000 cal diet
      //       // Check each nutr val.
      //       // If below 
      //       if(key != "name"){
      //         var needNutrition = false;
      //         var recommended = this.nutritionalData[key];
      //         var current = this.userNData[key] * modifier
      //         if (recommended/current > .5){
      //           needNutrition = true;
      //         }
      //         if(needNutrition){ // certain nutritional values
      //           searchTerm = key.toUpperCase();
      //           min = (recommended-current)/4;
      //           if(min < 0){
      //             min = 0;
      //           }
      //           max = recommended-current;
      //           APICall += "&nutrition." + searchTerm +".min="+min+"&nutrition." + searchTerm + ".max="+max;
      //           //add search_term to query
      //         }
      //       }
      //     }
      //   }

        //Most needed nutritional
        var mostNeededKey = "na";
        var highestDebt = 0;
        for (var key in this.userNData){
          var recommended = this.nutritionalData[key];
          var current = this.userNData[key] * modifier
          var debt = recommended - current;
          if (debt > highestDebt && debt > 0) {
            highestDebt = 0;
            mostNeededKey = key;
          }
        }

        //Requirements Parsing
        for (var i = 0; i < this.currentUser.requirements.length; i++) {
          curRequirement = this.currentUser.requirements[i];
          if (curRequirement.tag == "allergy"){
            APICall += "&allowedAllergy[]=" + curRequirement.yummly_search;
          }else if (curRequirement.tag == "mealType"){
            APICall +="&allowedCourse[]=course" + curRequirement.yummly_search;
          }else if (curRequirement.tag == "diet"){
            APICall += "&allowedDiet[]=" + curRequirement.yummly_search;
          }
        }

        //Remove Beverages
        // APICall += "&excludedCourse[]=course^course-Beverages"
        // //Random Seed (Each page 1-10)
        // APICall = this.generateRandomSeed(APICall);

        // //Actually get the data
        // axios
        //   .get(APICall)
        //   .then(function(response) {
        //     console.log(response.data);
        //     this.createRecipe(response.data);
        //   }.bind(this)
        //   ).catch(
        //     function(error) {
        //       console.log(error);
        //       this.errors = error.response.data.errors;
        //     }.bind(this)
        //   );
      }
  },

  computed: {}
};

var RecipeDetailPage = {
  template: "#recipe-detail-page",
  data: function() {
    return {
      currentUser: {username: "Loading", recipes: []},
      recipe: {},
      id: "",
      errors: []

    };
  },
  created: function() {
        this.id = this.$route.params["id"];
        console.log("ID:" + this.id);
        axios
        .get("/users")
        .then(function(response) {
          console.log(response.data);
          this.currentUser = response.data.current_user;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
        var appID = "46598055";
        var appKEY = "3c7da548f3efa79721643dd19d25e1da";
        var APICall = "http://api.yummly.com/v1/api/recipe/" + this.id + "?_app_id=" + appID + "&_app_key=" + appKEY;
        axios
        .get(APICall)
        .then(function(response) {
          console.log(response.data);
          this.recipe = response.data;
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
            

  },
  methods: {
    generate_recipe: function(){
      //API Example Call: http://api.yummly.com/v1/api/recipe/Easy-Mexican-Fiesta-Pasta-Salad-2337618?_app_id=46598055&_app_key=3c7da548f3efa79721643dd19d25e1da
      var appID = "46598055";
      var appKEY = "3c7da548f3efa79721643dd19d25e1da";
      // http://api.yummly.com/v1/api/recipe/Easy-Mexican-Fiesta-Pasta-Salad-2337618?_app_id=46598055&_app_key=3c7da548f3efa79721643dd19d25e1da
      var APICall = "http://api.yummly.com/v1/api/recipe/" + recipeID + "?_app_id=" + appID + "&_app_key=" + appKEY;

      }
  },
  computed: {}
};



var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      username: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      gender: "m",
      age: 18,
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        username: this.username,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        gender: this.gender,
        age: this.age
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        }.bind(this)
        ).catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/profile");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};




var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};



var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/about", component: AboutPage },
  { path: "/contact", component: ContactPage },
  { path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage },
  { path: "/profile", component: ProfilePage },
  { path: "/add_past_meal", component: PastMealPage },
  { path: "/add_requirement", component: RequirementPage },
  { path: "/generate_recipe", component: RecipePage },
  { path: "/recipe_detail/:id", component: RecipeDetailPage}



  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});