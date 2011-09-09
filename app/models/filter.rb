class Filter < Struct.new(:klass)
  def call(*args); end
end

module ToCreateFilter
  def call(*args)
    start_time = args.shift
    end_time = args.shift
    super(*args)
    klass.where(active:1).where(
      :created_at => start_time..end_time
    )
  end
end

module ReviewTypeFilter
  def call(*args)
    status = args.shift
    super(*args)
    result = klass.scoped.joins(:reviews).
      where('reviews.status' => status )
  end
end

module ReviewFilter
  def call(*args)
    low = args.shift
    super(*args)
    d = klass.scoped.joins(:reviews).having("sum(reviews.status) >= ?", low)
  end
end
