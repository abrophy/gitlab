class Gitlab::Client
  # Defines methods related to events.
  # @see https://docs.gitlab.com/ce/api/events.html
  module Events
    # Gets a list of authenticated user's events
    #
    # @example
    #   Gitlab.events()
    #   Gitlab.events({ action: 'created', target_type: 'issue' })
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [String] :action Only events of specific action type
    # @option options [String] :target_type Only events of specific target type
    # @option options [Date] :before Only events created before date
    # @option options [Date] :after Only events created after date
    # @option options [String] :sort Sort by created_at either 'asc' or 'desc'
    # @return [Array<Gitlab::ObjectifiedHash>]
    def events(options={})
      get('/events', query: options)
    end

    # Gets a list of user contribution events
    #
    # @example
    #   Gitlab.user_events(1)
    #   Gitlab.user_events(1, { action: created})
    #
    # @param  [Integer, String] user The ID or username of user
    # @param  [Hash] options A customizable set of options.
    # @option options [String] :action Only events of specific action type
    # @option options [String] :target_type Only events of specific target type
    # @option options [Date] :before Only events created before date
    # @option options [Date] :after Only events created after date
    # @option options [String] :sort Sort by created_at either 'asc' or 'desc'
    # @return [Array<Gitlab::ObjectifiedHash>]
    def user_events(user, options={})
      get("/users/#{url_encode user}/events", query: options)
    end
  end
end
