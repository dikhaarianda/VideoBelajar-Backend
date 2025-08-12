const { ok, err } = require('./response.service')

function parseIdFromParams(params, pkFields) {
  if (!Array.isArray(pkFields) || pkFields.length === 0) {
    throw new Error('pkFields required')
  }
  if (pkFields.length === 1) {
    return params[pkFields[0]]
  }
  const obj = {}
  pkFields.forEach((k) => { obj[k] = params[k] })
  return obj
}

function buildCrudController({ service, pkFields = [], resourceName = 'resource' }) {
  const getAll = async (req, res) => {
    try {
      const data = await service.getAll()
      return ok(res, data, `${resourceName} fetched`)
    } catch (e) {
      console.error(`[controller:${resourceName}] getAll`, e)
      return err(res)
    }
  }

  const getById = async (req, res) => {
    try {
      const idOrObj = parseIdFromParams(req.params, pkFields)
      const row = await service.getById(idOrObj)
      if (!row) return err(res, 'Data not found', 404)
      return ok(res, row, `${resourceName} fetched`)
    } catch (e) {
      console.error(`[controller:${resourceName}] getById`, e)
      return err(res)
    }
  }

  const create = async (req, res) => {
    try {
      const created = await service.create(req.body || {})
      return ok(res, created, `${resourceName} created`)
    } catch (e) {
      console.error(`[controller:${resourceName}] create`, e)
      return err(res)
    }
  }

  const updateById = async (req, res) => {
    try {
      const idOrObj = parseIdFromParams(req.params, pkFields)
      const result = await service.updateById(idOrObj, req.body || {})
      return ok(res, result, `${resourceName} updated`)
    } catch (e) {
      console.error(`[controller:${resourceName}] updateById`, e)
      return err(res)
    }
  }

  const deleteById = async (req, res) => {
    try {
      const idOrObj = parseIdFromParams(req.params, pkFields)
      const result = await service.deleteById(idOrObj)
      return ok(res, result, `${resourceName} deleted`)
    } catch (e) {
      console.error(`[controller:${resourceName}] deleteById`, e)
      return err(res)
    }
  }

  return { getAll, getById, create, updateById, deleteById }
}

module.exports = { buildCrudController }