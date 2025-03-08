const typesenseInstantsearchAdapter = new TypesenseInstantSearchAdapter({
    server: {
        apiKey: '376SV5USVaFsMyytWWdc35Hbmt7xubs1', // Be sure to use an API key that only allows searches, in production
        nodes: [
            {
                host: 'syriac-liturgy.org',
                path: '/search/typesense',
                port: '443',
                protocol: 'https',
            },
        ],
    },
    // The following parameters are directly passed to Typesense's search API endpoint.
    //  So you can pass any parameters supported by the search endpoint below.
    //  queryBy is required.
    //  filterBy is managed and overridden by InstantSearch.js. To set it, you want to use one of the filter widgets like refinementList or use the `configure` widget.
    additionalSearchParameters: {
        'query_by': 'text_of_section'
    }
});
const searchClient = typesenseInstantsearchAdapter.searchClient;

const search = instantsearch({
    searchClient,
    indexName: 'liturgicalSections15112024',
});

search.addWidgets([
    instantsearch.widgets.searchBox({
        container: '#searchbox',
    }),
    instantsearch.widgets.configure({
        hitsPerPage: 8
    }),
    instantsearch.widgets.hits({
        container: '#hits',
        templates: {
            item(item) {
                let searchStrings = item._highlightResult.text_of_section.matchedWords;
		function highlightText(text,match){ return text.replace(new RegExp(match,'gi'),'<span style="background-color: #ffc107;">$&</span>'); }
		const highlightedText = function(){
		   let text = item.text_of_section;
		   for (const searchString of searchStrings){
			text = highlightText(text,searchString);
		   }
		   return text;
		}
                return `
                      <div><b>
                        ${ item.document_title } - ${ item.title_of_section }
                      </b>
                      </div>
                      <div>
                        ${ highlightedText() }
                      </div>
                  `;
            },
        },
    }),
    instantsearch.widgets.pagination({
        container: '#pagination',
    }),
]);

search.start();
  
