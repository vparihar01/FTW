class API::PivotalQuest

  def initialize(pivotal_story)
    @pivotal_story = pivotal_story
  end

  def quest_id
    @pivotal_story.id
  end

  def owned_by
    @pivotal_story.owned_by
  end

  def name
    @pivotal_story.name
  end

  def state
    @pivotal_story.current_state
  end

  def labels
    @pivotal_story.labels
  end

  def estimation
    @pivotal_story.estimate
  end

  def bug?
    @pivotal_story.story_type == "bug"
  end

  def feature?
    @pivotal_story.story_type == "feature"
  end

  def start!
    @pivotal_story.update(:current_state => "started")
  end

  def finish!
    @pivotal_story.update(:current_state => "finished")
  end

  def estimate!(points)
    @pivotal_story.update(:estimate => points)
  end

  def deliver!
    @pivotal_story.update(:current_state => "delivered")
  end

  def accept!
    @pivotal_story.update(:current_state => "accepted")
  end

  def label!(labels)
    labels << self.labels
    @pivotal_story.update(:labels => labels.join(" "))
  end



end