            Reviews:
            <ul>
            <% @beach.reviews.each do |review| %>
                <li>
                    Reviewed by <%= review.user.firstname %> on: <%= review.date_updated %>
                    <ul>
                        <li>
                            <%= review.overall_rating %> stars: <%= review.overall_description %> 
                        </li>
                        <li>
                            (<%= link_to "Go to review", review_path(review)%>)
                        </li>
                    </ul>
                </li>
            <% end %>
            </ul>