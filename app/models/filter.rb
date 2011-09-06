class Filter < Struct.new(:klass)
  def call(*args); end
end

module ToCreateFilter
  def call(*args)
    start_time = args.shift
    end_time = args.shift
    klass.where(active:1).where(
      :created_at => start_time..end_time
    )
    super(*args)
  end
end

module ReviewTypeFilter
  def call(*args)
    status = args.shift
    klass.joins(:reviews).
      where('reviews.status' => status )
    super(*args)
  end
  end
