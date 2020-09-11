class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq  
            # convert "tag1, tag2, tag3" into array of unique ["tag1", "tag2", "tag3"]
        
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
            # go through each of those tag_names and find or create a tag with that name
        
        self.tags = new_or_found_tags
            # collect up these new or found new tags and then assign them to ARTICLE

    end
    
      
end
