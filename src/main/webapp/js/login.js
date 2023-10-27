// const signUpBtn = document.getElementById("signUp");
// const signInBtn = document.getElementById("signIn");
// const container = document.querySelector(".container");

// signUpBtn.addEventListener("click", () => {
//   container.classList.add("right-panel-active");
// });
// signInBtn.addEventListener("click", () => {
//   container.classList.remove("right-panel-active");
// });


const ownerLoginBtn = document.getElementById("ownerLoginBtn");
const employeeLoginBtn = document.getElementById("employeeLoginBtn");
const container = document.querySelector(".container");

ownerLoginBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

employeeLoginBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});
