$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {

  //show page for courses
  $("a.show_courses").on("click", function(e) {
    e.preventDefault();

    let id = $(this).attr("data-id")
    let semesterid = $(this).attr("data-semesterid")

    $.get(`/semesters/${semesterid}/courses/${id}.json`, function(json) {

      $(".courses").html("")


      // debugger
        $(".courses").append("<h2>" + json.name + "</h2>" +
                            "<h2> Code: " + json.code + "</h2>" +
                            "<h3> Semester code: " + json.semester_id + "</h2>"
      )

    })
  })


  // clicking on More button in semesters index
  $("a.js-more").on("click", function(e) {
    // debugger
    e.preventDefault();
    let id = $(this).attr("data-id")
    let semesterid = $(this).attr("data-semesterid")
    // debugger
    $.get("/semesters/" + semesterid + "/courses/" + id + ".json", function(course) {
      $("#code-" + id).html("Course code: " + course.code)
    })
  })

  //show list of assignments for a course
  $("a.show_assignments").on("click", function(e) {
    e.preventDefault();
    const semesterId = $(this).attr("data-semesterid")
    const courseId = $(this).attr("data-courseid")

    $.get(`/semesters/${semesterId}/courses/${courseId}/assignments.json`).success(function(json) {
      $(".load_assignments").html("")
      // debugger

    json.forEach(function(assignment) {
      $(".load_assignments").append("<h2>" + assignment.name + "</h2>")
    })
    })


  })

  //clicking on Next button
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    let id = $(this).attr("data-id")
    // debugger
    let nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/semesters/" + id + "/courses/" + nextId + ".json").success(function(course) {
      // debugger
      $("div.next").html(course.name)
    })

  })

  // show all semesters in course catalog
    // $(".all_semesters").on("click", function(e) {
    //   e.preventDefault();
    //   $.get("/semesters.json").success(function(json) {
    //     var $ol = $("div.semesters ol")
    //     $ol.html("") // empty the ol
    //     $("div.welcome").html("") //empty the welcome main page
    //     // debugger
    //     // var jsonKeys = Object.keys(json);
    //     json.forEach(function(semester) {
    //       // debugger
    //       $ol.append("<li>" + semester.name + "</li>");
    //     })
    //   })
    //
    //
    // })
}

function Assignment(assignment) {
  this.id = assignment.id;
  this.name = assignment.name
  this.description = assignment.description
  this.date = assignment.date
  this.status = assignment.status
  this.userId = assignment.user_id
}

Assignment.prototype.formatIndex = function() {
  // console.log(this)
  let html = ""
  html = `<h1>${this.name}</h1>` +
          `<h3>${this.description}</h3>` +
          `<h3>Due date: ${this.date}</h3>`


  $("#assignmentName").append(html)
}


//Submit assignments via ajax
$(function() {
  $("#new_assignment").on("submit", function(e) {
    e.preventDefault();
    // url = $(this).url
    const action = $(this).attr('action') + ".json"
    const id = $(this).attr("data-id")
    const values = $(this).serialize();
    // debugger

    //using low-level ajax instead of $.post
    $.ajax({
      url: action,
      data: values,
      dataType: "json",
      method: "POST"
    })
    .success(json => {
      // console.log(json)
      // html = ""
      // html += "<li>" + json.name + "</li>"

      const newAssignment = new Assignment(json)
      // console.log(newAssignment)
      newAssignment.formatIndex();
      // debugger
      // $("#assignmentName").append(newAssignment["name"])

    })
    .error(function() {
      alert("You are not authorized to create an assignment")
    })
    // debugger
    // let posting = $.post("/assignments", values);
    //
    // posting.done(function(data) {
    //
    //   // debugger
    //   const newAssignment = new Assignment(data)
    //   console.log(newAssignment)
    //   let assignmentHtml = newAssignment.formatIndex()
    //   // debugger
    //   // $("#assignmentName").append(newAssignment["name"])
    //
    //   $("#assignmentName").append(assignmentHtml)
    // })
  })
})






// create Grade
// function grade(g)

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
