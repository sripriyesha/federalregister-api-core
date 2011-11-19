module Content
  module RegulationsDotGov
    class Client < GwtRpc::Client
      domain 'www.regulations.gov'
      js_url 'http://www.regulations.gov/Regs/'
      gwt_permutation '96ED140EA002EA7F0224967DBF229721'
      timeout 2000
      num_attempts 3
      
      map_classes 'gov.egov.erule.regs.shared.action.LoadSearchResultsResult'            => 'Content::RegulationsDotGov::SearchResultPackage',
                  'gov.egov.erule.regs.shared.models.SearchResultModel'                  => 'Content::RegulationsDotGov::SearchResult',
                  'gov.egov.erule.regs.shared.models.Agency'                             => 'Content::RegulationsDotGov::Agency',
                  'gov.egov.erule.regs.shared.models.DimensionCounterFilter'             => 'Content::RegulationsDotGov::DimensionCounter',
                  'gov.egov.erule.regs.shared.models.CommentPeriod'                      => 'Content::RegulationsDotGov::CommentPeriod',
                  'gov.egov.erule.regs.shared.models.DocumentSummaryModel'               => 'Content::RegulationsDotGov::DocumentSummary',
                  'gov.egov.erule.regs.shared.resources.SharedConstants$DOCUMENT_STATUS' => 'Content::RegulationsDotGov::DocumentStatus',
                  'gov.egov.erule.regs.shared.models.DocumentType'                       => 'Content::RegulationsDotGov::DocumentType',
                  'gov.egov.erule.regs.shared.models.DocketType'                         => 'Content::RegulationsDotGov::DocketType'
    
      add_procedure(:search, :path => '/dispatch/LoadSearchResultsAction') do |term|
        "7|0|17|http://www.regulations.gov/Regs/|A7D51DAC75A664C72891603F2A86026B|com.gwtplatform.dispatch.shared.DispatchService|execute|java.lang.String/2004016611|com.gwtplatform.dispatch.shared.Action|213bd8563b741ecf6cd00b8de51ce7bcaf8e1c86343bc91b38a8da6623658d78.e38Sc3uTa3qQe3iLb40|gov.egov.erule.regs.shared.action.LoadSearchResultsAction/125242584|gov.egov.erule.regs.shared.models.SearchQueryModel/1556278353|java.util.ArrayList/4159755760||#{term}|gov.egov.erule.regs.shared.models.DataFetchSettings/1603506619|java.lang.Integer/3438268394|docketId|DESC|java.lang.Boolean/476441737|1|2|3|4|2|5|6|7|8|0|9|10|0|11|11|11|10|0|3|10|1|5|12|13|14|0|15|16|14|10|-8|11|11|11|17|0|1|0|"
      end
    end
    
    class SearchResultPackage
      def self.gwt_deserialize(reader)
        reader.read_object
      end
    end
  
    class SearchResult
      def self.gwt_deserialize(reader)
        reader.read_object
        reader.read_object
        reader.read_object
      end
    end
  
    class Agency
      def self.gwt_deserialize(reader)
        reader.read_string # abbr
        reader.read_object # num_results
        reader.read_string # id
        reader.read_string # name
      end
    end
  
    class DimensionCounter
      def self.gwt_deserialize(reader)
        reader.read_object
        reader.read_object
      end
    end
  
    class CommentPeriod
      def self.gwt_deserialize(reader)
        reader.read_int
      end
    end
  
    class DocumentStatus
      def self.gwt_deserialize(reader)
        reader.read_int
      end
    end
  
    class DocumentType
      def self.gwt_deserialize(reader)
        reader.read_int
      end
    end
  
    class DocketType
      def self.gwt_deserialize(reader)
        reader.read_int
      end
    end
    
    class DocumentSummary
      attr_accessor :document_id
    
      def initialize(document_id, allows_comments)
        @document_id = document_id
        @allows_comments = allows_comments
      end
    
      def allows_comments?
        @allows_comments
      end
      
      def comment_url
        "http://www.regulations.gov/#!submitComment;D=#{document_id}" if allows_comments?
      end
      
      def url
        "http://www.regulations.gov/#!documentDetail;D=#{document_id}"
      end
    
      def self.gwt_deserialize(reader)
        # Some stuff we don't care about
        reader.read_int
        reader.read_string
        reader.read_object
        reader.read_int
        
        allows_comments = reader.read_object
        
        # Some more stuff we don't care about
        reader.read_object
        reader.read_string
        reader.read_string
        reader.read_int
        reader.read_string
        reader.read_string
        reader.read_string
        reader.read_string
        reader.read_object
        
        document_id = reader.read_string
        
        # Some more stuff we don't care about
        reader.read_object
        reader.read_object
        reader.read_object
        reader.read_object
        reader.read_object
        reader.read_object
        reader.read_object
        reader.read_string
        reader.read_string
        reader.read_object
        reader.read_string
        reader.read_string
        reader.read_string
        reader.read_string
        reader.read_string
        reader.read_string
        reader.read_object
        
        self.new(document_id, allows_comments)
      end
    end
  end
end
