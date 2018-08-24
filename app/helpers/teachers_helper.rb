module TeachersHelper
  # Returns the Gravatar for the given teacher.
   def gravatar_for(teacher, options = { size: 80 })
     gravatar_id = Digest::MD5::hexdigest(teacher.email.downcase)
     size = options[:size]
     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
     image_tag(gravatar_url, alt: teacher.name, class: "gravatar")
   end
 end

 # module TeachersHelper
 #   # Returns the Gravatar for the given teacher.
 #    def gravatar_for(teacher, size: 20)
 #      gravatar_id = Digest::MD5::hexdigest(teacher.email.downcase)
 #      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
 #      image_tag(gravatar_url, alt: teacher.name, class: "gravatar")
 #    end
 #  end

 # module TeachersHelper
 #   # Returns the Gravatar for the given teacher.
 #    def gravatar_for(teacher)
 #      gravatar_id = Digest::MD5::hexdigest(teacher.email.downcase)
 #      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
 #      image_tag(gravatar_url, alt: teacher.name, class: "gravatar")
 #    end
 #  end
