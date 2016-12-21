class CreateCompany
  include Interactor

  delegate :owner, :name, :domain, to: :context

  def call
    context.company = created_company
  end

  def created_company
    created_company = Company.create(name: name, domain: domain, owner: owner)
    if created_company
      owner.update(company: created_company)
    else
      context.fail!
    end

    created_company
  end
end
