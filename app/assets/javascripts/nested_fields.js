document.addEventListener("turbo:load", function () {
  // Add fields dynamically
  document.querySelectorAll(".add_fields").forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();
      let time = new Date().getTime();
      let association = this.dataset.association;
      let regexp = new RegExp("new_" + association, "g");
      let fields = this.dataset.fields.replace(regexp, time);
      this.insertAdjacentHTML("beforebegin", fields);
    });
  });

  // Remove fields dynamically
  document.body.addEventListener("click", function (e) {
    if (e.target && e.target.classList.contains("remove_fields")) {
      e.preventDefault();
      let field = e.target.closest(".nested-fields");
      if (field) {
        field.querySelector("input[type='hidden']").value = "1";
        field.style.display = "none";
      }
    }
  });
});
