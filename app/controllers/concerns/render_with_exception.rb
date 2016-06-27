module RenderWithException
  def render_with_exception(path:, &block)
    if block_given?
      begin
        yield
      rescue => e
        redirect_to path, { notice: e.message }
      end
    end
  end
end
