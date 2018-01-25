// $(document).ready(function() {
//   $(".all_semesters").on("click", function(e) {
//     $.get(this.href).success(function(json) {
//       var $ol = $("div.semesters ol")
//       $ol.html("") // empty the ol
//       // debugger
//       // var jsonKeys = Object.keys(json);
//       json.forEach(function(semester) {
//         // debugger
//         $ol.append("<li>" + semester.name + "</li>");
//       })
//     })
//     e.preventDefault();
//     // console.log("hi")
//   })
// })

$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $("a.show_courses").on("click", function(e) {
    e.preventDefault();

    $.get(this.href).success(function(json) {
      // debugger
    $(".courses").html("")

    json.forEach(function(course) {
      // debugger
      $(".courses").append("<h2>" + course.name + "</h2>")
    })
    })

  })
}

// //ajax
// const bindClickHandlers = () => {
//   $("a.show_courses").on("click", function(e) {
//     $.ajax({
//       method: "GET",
//       url: this.href
//     }).success(function(response){
//       $("div.courses").html(response)
//     })
//     e.preventDefault()
//   })
// }
// $(document).ready(function() {
//   $(".all_semesters").on("click", function(e) {
//
//     e.preventDefault();
//     fetch(`/semesters.json`)
//     .then(res => json())
//     .then(semesters => {
//       $('div.semesters').html('hi')
//       semesters.forEach(sem => {
//       //   console.log(sem)
//       // })
//     })
//   })
// })
// })
