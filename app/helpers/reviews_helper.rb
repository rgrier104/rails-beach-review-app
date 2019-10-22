module ReviewsHelper

    def set_or_select_beach(f)
        if @beach
            content_tag(:h2, "Review for #{@beach.name}")
            f.hidden_field :beach_id
        else
            render partial: "beachform", locals: {f: f}
        end
    end

end
