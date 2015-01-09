var dataObject = {
  "timeline":
  {
    "headline":"History Timeline",
    "type":"default",
    "text":"<p>Welcome to the History Timeline!</p>",
    "asset": {
      "media":"http://cdn.shopify.com/s/files/1/0080/8372/products/tattly_lim_heng_swee_book_lover_web_design_01_grande.jpg?v=1346166432",
      "credit":"Credits to Giraffe booklovers",
      "caption":"Look at this neat giraffe."
    },
    "date": [
    {
      "startDate":"1846,10,16",
      "endDate":"1846,10,16",
      "headline":"First Public Operation with Anesthesia",
      "text":"<p>Anesthesia was discovered by William Morton, an American dentist, in 1846. Boston surgeon Henry Jacob Bigelow heard about his discovery in the newspapers and arranged for a demonstration at the operating theater of Massachusetts General Hospital, during which Dr. John Collins Warren painlessly removed a tumor from a patient. News of anesthesia spread rapidly after.</p>",
      "classname":"timeline-entry1",
      "asset": {
        "media":"http://upload.wikimedia.org/wikipedia/commons/4/4b/Southworth_%26_Hawes_-_First_etherized_operation_%28re-enactment%29.jpg",
        "thumbnail":"http://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Southworth_%26_Hawes_-_First_etherized_operation_%28re-enactment%29.jpg/605px-Southworth_%26_Hawes_-_First_etherized_operation_%28re-enactment%29.jpg",
        "credit":"Southworth & Hawes",
        "caption":"Operating room of the Massachusetts General Hospital, Boston"
      }
    },
      {
        "startDate":"1989,4,16",
        "endDate":"1989,4,16",
        "headline":"Tiananmen Square protests!",
        "text":"<p>The protests were student-led demonstrations triggered by the death of former Communist Party general secretary, Hu Yaobang, who was deposed after losing a power struggle over the direct of political and economic reform.</p>",
        "classname":"timeline-entry2",
        "asset": {
          "media":"http://www.beetlesandhuxley.com/sites/default/files/stock-images/THE-TANK-MAN-STOPPING-THE-COLUMN-OF-T59-TANKS-TIANANMEN-SQUARE-BEIJING-CHINA-4-JUNE-1989-1-C31709.jpg",
          "credit":"Jeff Widener (The Associated Press)",
          "caption":"Tank man blocks a column of Type 59 tanks heading east on Beijing's Chang'an Boulevard (Avenue of Eternal Peace) near Tiananmen Square."
        }
      }
    ],
  }
}

$(document).ready(function() {
  createStoryJS({
    type:       'timeline',
    width:      '100%',
    height:     '600',
    source:     dataObject,
    embed_id:   'timeline-embed'
  });
});
