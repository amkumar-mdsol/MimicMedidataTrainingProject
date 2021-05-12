Delayed::Worker.queue_attributes = {
  top_most_priority: { priority: -10 },
  medium_priority: { priority: 0 },
  least_priority: { priority: 10 }
}