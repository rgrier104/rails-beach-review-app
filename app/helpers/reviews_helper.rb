module ReviewsHelper

    def set_or_select_beach(f)
        if @review.beach.name
            content_tag(:h2, "Review for #{@review.beach.name}")
            f.hidden_field :beach_id
        else
            render partial: "beachform", locals: {f: f}
        end
    end

    def display_image
        image_tag url_for(@review.image.variant(resize_to_fit: [300, 300]).processed) if @review.image.attached?
    end

    def display_attributes(review)
        attr_array = []
            attr_array << "swimming" if review.swimming
            attr_array << "snorkeling" if review.snorkeling
            attr_array << "paddleboarding" if review.paddleboarding
            attr_array << "sunrise" if review.sunrise
            attr_array << "sunset" if review.sunset
        attr_array
    end

    def create_attr_array(review)
        display_attributes(@review).each do |attribute|
            content_tag(:li, "#{attribute}")
        end
    end

    def list_attr(review)
        content_tag :ul do
            create_attr_array(review).collect {|attr| concat(content_tag(:li, attr))}
        end
    end

    def display_parking_rating(review)
        content_tag(:p,"Parking Rating (1-5): #{review.parking_rating}") if review.parking_rating
    end

    def display_parking_details(review)
        content_tag(:p,"Parking Details: #{review.parking_description}") if review.parking_description.present?
    end

end
