var serverAddr = "http://localhost:3000"

function getItems(endpoint, completion) {
  $.when($.getJSON(serverAddr + endpoint)).then(function (data, response, jqXHR) {
      completion(data);
  });
}

function textCompletionFor(endpoint, field, text, completion) {
  $.when($.getJSON(serverAddr + endpoint + field + "=eq." + text)).then(function (data, response, jqXHR) {
    if (date.length > 0) {
      completion(data[0]);
    } else {
      completion(undefined);
    }
  });
}

function doesExist(endpoint, fields, values, completion) {
  var filter = "";
  fields.forEach(function(current, index, theArray) {
    filter = filter + current + "=eq." + values[index] + "&"
  });

  $.when($.getJSON(serverAddr + endpoint + "?" + filter)).then(function (data, response, jqXHR) {
    if(data.length > 0) {
      completion(true, data[0].id);
    } else {
      completion(false, undefined);
    }
  });
};

function createReview(reviewerId, placeId, bottleId, reviewRadarId, reviewNote, completion) {
  $.post( serverAddr + "/review", { note: reviewNote, date: Date(), id_place: placeId, id_bottle: bottleId, id_people: reviewerId, id_fields: reviewRadarId })
  .done(function( newReview ) {
    console.log( "Review added: " + newReview );
    createRadarFields(reviewRadarObject, newReview.id)
    completion(data);
  });
}

function createBottle(bottleObject, completion) {
  $.post( serverAddr + "/bottle", { name: bottleObject["bottleName"], age: bottleObject["age"], vintage: bottleObject["vintage"], cask_number: bottleObject["caskNumber"], alcohol_volume: bottleObject["alcoholVolume"], 
                                    is_collector: bottleObject["isCollector"], total_bottle_count: bottleObject["totalBottleCount"], 
                                    id_brand: bottleObject["brandId"],
                                    id_distillery: bottleObject["distilleryId"],
                                    id_cask_types: bottleObject["caskTypeId"],
                                    id_cask_origin: bottleObject["caskOriginId"],
                                    id_cask_size: bottleObject["caskSizeId"],
                                    id_grain_type: bottleObject["grainTypeId"] })
  .done(function( data ) {
    console.log( "Bottle added: " + data );
    completion(data);
  });
}

function getBottleId(bottleObject, completion) {
  var bottleFields = ["name", "age", "vintage", "cask_number", "alcohol_volume", "is_collector", "total_bottle_count", "id_brand", "id_distillery", "id_cask_types", "id_cask_origin", "id_cask_size", "id_grain_type"];
  var bottleValues = [bottleObject["bottleName"], bottleObject["age"], ["vintage"], bottleObject["caskNumber"], bottleObject["alcoholVolume"], bottleObject["isCollector"], bottleObject["totalBottleCount"], bottleObject["brandId"], bottleObject["distilleryId"], bottleObject["caskTypeId"], bottleObject["caskOriginId"], bottleObject["caskSizeId"], bottleObject["grainTypeId"]];

  doesExist("/bottle", bottleFields, bottleValues, function(exists, objectId) {
    if(exists) {
      completion(objectId)
    } else {
      createBottle(bottleObject, function(newBottle) {
        completion(newBottle.id)
      });
    }
  });
}

//reviewRadarObject is an array of objects
function createRadarFields(reviewRadarObject, reviewId) {
  reviewRadarObject.forEach(function(current, index, theArray) {
    $.post( serverAddr + "/field_level", { level: current.level, id_star_field: current.starFieldId, id_review: reviewId }) 
    .done(function( fieldLevel ) {
      console.log( "radar field level added: " + data );
    });
  })
}

function addReview( reviewerId, 
                    placeId, 
                    bottleObject,
                    reviewRadarObject,
                    reviewNote
                    ) {
  //Create bottle
  getBottleId(bottleObject, function(bottleId) {
      createReview(reviewerId, placeId, bottleId, reviewRadarId, reviewNote, function(newReview) {
        console.log("new review created:" + newReview)
      })
  })
}

//EXECUTE

doesExist("/country", ["id"], ["11"], function(exists, objectId) {
  console.log(exists);
});

// CREATE Objects

function createBottleObject(name, age, vintage, caskNumber, alcoholVolume, isCollector, totalBottleCount, brandId, distilleryId, caskTypeId, caskOriginId, caskSizeId, grainTypeId) {
  var bottleObject = {
    bottleName: name,
    age: age,
    vintage: vintage,
    caskNumber: caskNumber,
    alcoholVolume: alcoholVolume,
    isCollector: isCollector, 
    totalBottleCount:totalBottleCount,
    brandId: brandId,
    distilleryId: distilleryId,
    caskTypeId: caskTypeId,
    caskOriginId: caskOriginId,
    caskSizeId: caskSizeId,
    grainTypeId: grainTypeId
  }
  return bottleObject
}

function createRadarObject( level_1, starFieldId_1,
                            level_2, starFieldId_2,
                            level_3, starFieldId_3,
                            level_4, starFieldId_4,
                            level_5, starFieldId_5,
                            level_6, starFieldId_6) {

  var reviewRadarObject = [{ level_1: level_1, starFieldId_1: starFieldId_1},
                          { level_2: level_2, starFieldId_2: starFieldId_2},
                          { level_3: level_3, starFieldId_3: starFieldId_3},
                          { level_4: level_4, starFieldId_4: starFieldId_4},
                          { level_5: level_5, starFieldId_5: starFieldId_5},
                          { level_6: level_6, starFieldId_6: starFieldId_6}];

  return reviewRadarObject;
}

