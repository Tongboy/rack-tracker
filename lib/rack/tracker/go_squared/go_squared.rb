class Rack::Tracker::GoSquared < Rack::Tracker::Handler
  class VisitorName < OpenStruct
    def write
      ['set', 'visitorName', self.name].to_json.gsub(/\[|\]/, '')
    end
  end

  class VisitorInfo < OpenStruct
    def write
      ['set', 'visitor', to_h].to_json.gsub(/\[|\]/, '')
    end
  end

  def tracker
    options[:tracker]
  end

  def trackers
    options[:trackers]
  end

  def visitor_name
    events.select{|e| e.kind_of?(VisitorName) }.first
  end

  def visitor_info
    events.select{|e| e.kind_of?(VisitorInfo) }.first
  end
end
