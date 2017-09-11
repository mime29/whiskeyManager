//Used to handle user interactions on the HTML
jQuery(document).ready(function(){
  jQuery('#reviewForm').on('submit', function(e){
    e.preventDefault();
    formSubmitted();
  });
});


function formSubmitted() {
    var canSubmit = checkMissingFields();

    if (canSubmit) {
        console.log("form submitted");
        var reviewerId = $("#people").val();
        var companyId = $("#companyName").val();
        var brandId = $("#brandName").val();
        var caskTypeId = $("#caskType").val();
        var caskOriginId = $("#caskOrigin").val();
        var caskSizeId = $("#caskSize").val();
        var distilleryId = $("#distillery").val();
        var grainTypeId = $("#grainType").val();
        var bottleName = $("#bottleName").val();
        var age = $("#age").val();
        var vintage = $("#vintage").val();
        var caskNumber = $("#caskNumber").val();
        var alcoholVolume = $("#alcoholVolume").val();
        var isCollector = $("#isCollector").val();
        var totalBottleCount = $("#totalBottleCount").val();
        var reviewNote = $("#reviewNote").val();
        var placeId = $("#place").val();
        var field1 = $("#field1").val();
        var field2 = $("#field2").val();
        var field3 = $("#field3").val();
        var field4 = $("#field4").val();
        var field5 = $("#field5").val();
        var field6 = $("#field6").val();

        console.log("reviewerId: " + reviewerId);
        console.log("companyId: " + companyId);
        console.log("brandId: " + brandId);
        console.log("caskTypeId: " + caskTypeId);
        console.log("caskOriginId: " + caskOriginId);
        console.log("caskSizeId: " + caskSizeId);
        console.log("distilleryId: " + distilleryId);
        console.log("grainTypeId: " + grainTypeId);
        console.log("bottleName: " + bottleName);
        console.log("age: " + age);
        console.log("vintage: " + vintage);
        console.log("caskNumber: " + caskNumber);
        console.log("alcoholVolume: " + alcoholVolume);
        console.log("isCollector: " + isCollector);
        console.log("totalBottleCount: " + totalBottleCount);
        console.log("reviewNote: " + reviewNote);
        console.log("placeId: " + placeId);
        console.log("field1: " + field1);
        console.log("field2: " + field2);
        console.log("field3: " + field3);
        console.log("field4: " + field4);
        console.log("field5: " + field5);
        console.log("field6: " + field6);

        var einBottle = createBottleObject(bottleName, age, vintage, caskNumber, alcoholVolume, isCollector, totalBottleCount, companyId, distilleryId, caskTypeId, caskOriginId, caskSizeId, grainTypeId);
        var einRadar = createRadarObject(field1, "1", //1 id the startfield id in data base hardcoded here
                                         field2, "2",
                                         field3, "3",
                                         field4, "4",
                                         field5, "5",
                                         field6, "6");

        addReview(reviewerId, placeId, einBottle, einRadar, reviewNote);
    }

}

function checkMissingFields() {
    var bottleName = $("#bottleName").val();
    var age = $("#age").val();
    var vintage = $("#vintage").val();
    var alcoholVolume = $("#alcoholVolume").val();
    var reviewNote = $("#reviewNote").val();

    if (bottleName == "" || age == "" || vintage == "" || alcoholVolume == "" || reviewNote == "") {
        alert("You forgot some fields. Same player, try again.");
        return false
    }
    return true;
}

