module ReviewsHelper

    def set_or_select_beach(f)
        if @review.id
            content_tag(:h2, "Review for #{@review.beach.name}")
            f.hidden_field :beach_id
        elsif params[:beach_id]
            @beaches = Beach.all
            f.collection_select :beach_id, @beaches || [], :id, :name, prompt: "Select beach"
        else
            @beaches = Beach.all
            render partial: "beachform", locals: {f: f}
        end
    end

    def review_index
        if params[:beach_id]
            render partial: "beachreviews", locals: {beach: @beach }
        else
            render partial: "reviews", locals: {reviews: @reviews }
        end
    end

    def display_image(review)
        image_tag url_for(review.image.variant(resize_to_fit: [200, 200]).processed) if review.image.attached?
    end

    def display_attributes(review)
        attr_array = []
            attr_array << "Swimming" if review.swimming
            attr_array << "Snorkeling" if review.snorkeling
            attr_array << "Paddleboarding" if review.paddleboarding
            attr_array << "Sunrise" if review.sunrise
            attr_array << "Sunset" if review.sunset
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

    def display_parking_description(review)
        content_tag(:p,"Parking Description: #{review.parking_description}") if review.parking_description.present?
    end

    def display_surfing_rating(review)
        content_tag(:p,"Surfing Rating (1-5): #{review.surfing_rating}") if review.surfing_rating
    end

    def display_surfing_description(review)
        content_tag(:p,"Surfing Description: #{review.surfing_description}") if review.surfing_description.present?
    end

end
