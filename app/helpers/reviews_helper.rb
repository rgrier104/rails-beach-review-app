module ReviewsHelper

    def set_or_select_beach(f)
        if @review.beach.name
            content_tag(:h2, "Review for #{@review.beach.name}")
            f.hidden_field :beach_id
        else
            render partial: "beachform", locals: {f: f}
        end
    end

end
