return function()
	local Manifest = require(script.Parent.Manifest)
	local Strict = require(script.Parent.Strict)

	beforeEach(function(context)
		local manifest = Manifest.new()

		context.manifest = Strict(manifest)
		context.testComponent = manifest:define("test", manifest.t.table)
	end)

	describe("assign", function()
		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:assign({}, 0, {})
			end).to.throw()
		end)

		it("should error when given any invalid entity ids", function(context)
			local manifest = context.manifest

			expect(function()
				manifest:assign({
					manifest:create(),
					0 }, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			local manifest = context.manifest

			expect(function()
				manifest:assign({
					manifest:create(),
					manifest:create(),
				}, context.testComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("stub", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:stub(0)
			end).to.throw()
		end)
	end)

	describe("all", function()
		it("should error when given any invalid component ids", function(context)
			expect(function()
				context.manifest:all(context.testComponent, 0)
			end).to.throw()
		end)
	end)

	describe("except", function()
		it("should error when given any invalid component ids", function(context)
			expect(function()
				context.manifest:except(context.testComponent, 0)
			end).to.throw()
		end)
	end)

	describe("updated", function()
		it("should error when given any invalid component ids", function(context)
			expect(function()
				context.manifest:updated(context.testComponent, 0)
			end).to.throw()
		end)
	end)

	describe("destroy", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:destroy(0)
			end).to.throw()
		end)
	end)

	describe("valid", function()
		it("should error when not given a number", function(context)
			expect(function()
				context.manifest:valid()
			end).to.throw()
		end)
	end)

	describe("has", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:has(0, context.testComponent)
			end).to.throw()
		end)

		it("should error when given any bad component ids", function(context)
			expect(function()
				context.manifest:has(context.manifest:create(), context.testComponent, 0)
			end).to.throw()
		end)
	end)

	describe("any", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:any(0, context.testComponent)
			end).to.throw()
		end)

		it("should error when given any bad component ids", function(context)
			expect(function()
				context.manifest:any(context.manifest:create(), context.testComponent, 0)
			end).to.throw()
		end)
	end)

	describe("get", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:get(0, context.testComponent)
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:get(context.manifest:create(), 0)
			end).to.throw()
		end)

		it("should error when the entity does not have the component", function(context)
			expect(function()
				context.manifest:get(context.manifest:create(), context.testComponent)
			end).to.throw()
		end)
	end)

	describe("tryGet", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:tryGet(0, context.testComponent)
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:tryGet(context.manifest:create(), 0)
			end).to.throw()
		end)
	end)

	describe("multiGet", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:multiGet(0, {}, context.testComponent)
			end).to.throw()
		end)

		it("should error when given any bad component ids", function(context)
			expect(function()
				context.manifest:multiGet(context.manifest:create(), {}, 0)
			end).to.throw()
		end)

		it("should error when the entity already has one of the given components", function(context)
			local e = context.manifest:create()
			context.manifest:add(e, context.testComponent, {})

			expect(function()
				context.manifest:multiGet(context.manifest:create(), {}, context.testComponent)
			end).to.throw()
		end)
	end)

	describe("add", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:add(0, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when the entity already has the given component", function(context)
			local e = context.manifest:create()
			context.manifest:add(e, context.testComponent, {})

			expect(function()
				context.manifest:add(e, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:add(context.manifest:create(), 0, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			expect(function()
				context.manifest:add(context.manifest:create(), context.textComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("tryAdd", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:tryAdd(0, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:tryAdd(context.manifest:create(), 0, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			expect(function()
				context.manifest:tryAdd(context.manifest:create(), context.textComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("multiAdd", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:multiAdd(0, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when the entity already has any of the given components", function(context)
			local e = context.manifest:create()
			context.manifest:multiAdd(e, context.testComponent, {})

			expect(function()
				context.manifest:multiAdd(e, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:multiAdd(context.manifest:create(), 0, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			expect(function()
				context.manifest:add(context.manifest:create(), context.textComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("getOrAdd", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:getOrAdd(0, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:getOrAdd(context.manifest:create(), 0, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			expect(function()
				context.manifest:getOrAdd(context.manifest:create(), context.textComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("replace", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:replace(0, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when the entity does not have the given component", function(context)
			expect(function()
				context.manifest:replace(context.manifest:create(), context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:replace(context.manifest:create(), 0, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			expect(function()
				context.manifest:replace(context.manifest:create(), context.textComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("addOrReplace", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:addOrReplace(0, context.testComponent, {})
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:addOrReplace(context.manifest:create(), 0, {})
			end).to.throw()
		end)

		it("should error when given a bad component type", function(context)
			expect(function()
				context.manifest:addOrReplace(context.manifest:create(), context.textComponent, Vector3.new())
			end).to.throw()
		end)
	end)

	describe("remove", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:remove(0, context.testComponent)
			end).to.throw()
		end)

		it("should error when the entity does not have the given component", function(context)
			expect(function()
				context.manifest:remove(context.manifest:create(), context.testComponent)
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			local e = context.manifest:create()
			context.manifest:add(e, context.testComponent, {})

			expect(function()
				context.manifest:remove(e, 0)
			end).to.throw()
		end)
	end)

	describe("tryRemove", function()
		it("should error when given an invalid entity id", function(context)
			expect(function()
				context.manifest:tryRemove(0, context.textComponent)
			end).to.throw()
		end)

		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:tryRemove(context.manifest:create(), 0)
			end).to.throw()
		end)
	end)

	describe("onAdded", function()
		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:onAdded(0)
			end).to.throw()
		end)
	end)

	describe("onRemoved", function()
		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:onRemoved(0)
			end).to.throw()
		end)
	end)

	describe("onUpdated", function()
		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:onUpdated(0)
			end).to.throw()
		end)
	end)

	describe("poolSize", function()
		it("should error when given a bad component id", function(context)
			expect(function()
				context.manifest:poolSize(0)
			end).to.throw()
		end)
	end)
end
