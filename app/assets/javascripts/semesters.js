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

// const bindClickHandlers = () => {
//   $("a.show_courses").on("click", function(e) {
//     $.get(this.href).success(function(json) {
//       var $ol = $("div.courses ol")
//       $ol.html("")
//       json.forEach(function(course) {
//         $ol.append("<li>" + course.name + "</li>");
//       })
//     })
//     e.preventDefault()
//   })
// }

const bindClickHandlers = () => {
  $("a.show_courses").on("click", function(e) {
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      console.log(data)
    })
    e.preventDefault()
  })
}
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
