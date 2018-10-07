class Lessonplan < ApplicationRecord
  belongs_to :teacher
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :teacher_id, presence: true
end
