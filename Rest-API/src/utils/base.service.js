const db = require('./knex.config')

function applyPkWhere(qb, primaryKeyFields, idOrObj) {
  if (!Array.isArray(primaryKeyFields) || primaryKeyFields.length === 0) {
    throw new Error('primaryKeyFields harus diisi minimal 1 field')
  }
  if (primaryKeyFields.length === 1) {
    const key = primaryKeyFields[0]
    const value = (typeof idOrObj === 'object' && idOrObj !== null) ? idOrObj[key] : idOrObj
    qb.where(key, value)
  } else {
    // composite keys
    primaryKeyFields.forEach((k) => {
      qb.where(k, idOrObj[k])
    })
  }
}

function buildService(tableName, primaryKeyFields = []) {
  const getAll = async () => {
    try {
      console.log(`[service:${tableName}] getAll() called`)
      const rows = await db(tableName).select('*')
      return rows
    } catch (err) {
      console.error(`[service:${tableName}] getAll error`, err)
      throw err
    }
  }

  const getById = async (idOrObj) => {
    try {
      console.log(`[service:${tableName}] getById()`, idOrObj)
      const qb = db(tableName).first('*')
      applyPkWhere(qb, primaryKeyFields, idOrObj)
      const row = await qb
      return row
    } catch (err) {
      console.error(`[service:${tableName}] getById error`, err)
      throw err
    }
  }

  const createData = async (data) => {
    try {
      console.log(`[service:${tableName}] create()`, data)
      const result = await db(tableName).insert(data)
      const insertId = Array.isArray(result) ? result[0] : result
      if (primaryKeyFields.length === 1 && typeof insertId === 'number') {
        const key = primaryKeyFields[0]
        const row = await db(tableName).where(key, insertId).first('*')
        return row || { ...data, [key]: insertId }
      }
      // composite / non auto increment
      return { ...data, _info: 'created' }
    } catch (err) {
      console.error(`[service:${tableName}] create error`, err)
      throw err
    }
  }

  const updateById = async (idOrObj, data) => {
    try {
      console.log(`[service:${tableName}] updateById()`, idOrObj, data)
      const qb = db(tableName)
      applyPkWhere(qb, primaryKeyFields, idOrObj)
      const affected = await qb.update(data)
      return { affected }
    } catch (err) {
      console.error(`[service:${tableName}] update error`, err)
      throw err
    }
  }

  const deleteById = async (idOrObj) => {
    try {
      console.log(`[service:${tableName}] deleteById()`, idOrObj)
      const qb = db(tableName)
      applyPkWhere(qb, primaryKeyFields, idOrObj)
      const affected = await qb.del()
      return { affected }
    } catch (err) {
      console.error(`[service:${tableName}] delete error`, err)
      throw err
    }
  }

  return {
    getAll,
    getById,
    create: createData,
    updateById,
    deleteById
  }
}

module.exports = {
  buildService
}