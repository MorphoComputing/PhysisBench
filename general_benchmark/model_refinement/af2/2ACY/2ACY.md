# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2ACY\seeds\seed_0\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.460 A
- tm_score_ca_ordered: 0.9855455538468224
- heavy_atom_rmsd: 2.683 A
- sidechain_heavy_atom_rmsd: 3.498 A
- **all-atom quality (honest):** heavy 2.683 A, sidechain 3.498 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4371
- bin_accuracy: 0.934

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.46848448201711906 -> 0.4499052500741862 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4594908724807974
- ga_delta_rmsd: -0.017758688966740543  ga_fitness_mode: energy
- pre_local_rmsd: 0.46303779345606605  localized_anchor_rmsd: 0.459503553482058

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** V86 → 3 conflicts (60%)
- explained: 3/5 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.052), conflicts/hub=1.0, max_incompat=2.65Å, chain_span=0.719
- **fix-first:** [LOW_CONFLICT] Root cause(s): V86 — explain ~3/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V19** — severity 1.11, 1 conflict(s); suspect input ~`K71` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 34.4,conf 0.99), D3@27.5Å(now 33.6,conf 0.99), E1@27.5Å(now 32.9,conf 0.98), T4@27.5Å(now 32.6,conf 0.98), K87@27.5Å(now 32.3,conf 0.98), V84@27.4Å(now 31.7,conf 0.97), I85@27.4Å(now 31.8,conf 0.97), G2@27.4Å(now 31.6,conf 0.97), L5@27.3Å(now 30.1,conf 0.93), K83@27.3Å(now 29.9,conf 0.91)
  - V86↔K71: targets 27.5/5.8Å but partners are 36.0Å apart → too_far_apart by 2.6Å
- **P53** — severity 0.76, 1 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): D42@27.3Å(now 29.9,conf 0.92)
  - D42↔D3: targets 27.3/6.3Å but partners are 35.5Å apart → too_far_apart by 1.9Å
- **T4** — severity 0.72, 1 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): G18@27.5Å(now 34.4,conf 0.99), D42@27.5Å(now 33.0,conf 0.98), K71@27.5Å(now 32.9,conf 0.98), Q43@27.5Å(now 32.6,conf 0.98), V19@27.5Å(now 32.6,conf 0.98), K15@27.5Å(now 32.3,conf 0.98), G44@27.5Å(now 32.3,conf 0.98), Q17@27.4Å(now 31.8,conf 0.97), H73@27.4Å(now 30.9,conf 0.95), G14@27.4Å(now 30.6,conf 0.95), S72@27.4Å(now 30.6,conf 0.95), P70@27.4Å(now 30.6,conf 0.95), F20@27.4Å(now 30.4,conf 0.94)
  - G18↔E1: targets 27.5/5.9Å but partners are 35.1Å apart → too_far_apart by 1.7Å
- **H73** — severity 0.71, 1 conflict(s); suspect input ~`K15` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 34.2,conf 0.99), K87@27.5Å(now 33.1,conf 0.98), D3@27.5Å(now 32.1,conf 0.98), I85@27.4Å(now 31.2,conf 0.96), T4@27.4Å(now 30.9,conf 0.95), E1@27.3Å(now 29.9,conf 0.93), L88@27.3Å(now 30.2,conf 0.93), D89@27.3Å(now 30.2,conf 0.93), V84@27.3Å(now 29.9,conf 0.92)
  - V86↔K15: targets 27.5/5.4Å but partners are 34.5Å apart → too_far_apart by 1.6Å
- **L5** — severity 0.63, 1 conflict(s); suspect input ~`V86` (group: pull_in)
  - pull-in (wants closer): G18@27.4Å(now 31.6,conf 0.97), K71@27.4Å(now 30.9,conf 0.95), K15@27.3Å(now 30.1,conf 0.93), V19@27.3Å(now 30.1,conf 0.93), D42@27.3Å(now 29.9,conf 0.92), Q43@27.3Å(now 29.8,conf 0.92)
  - K71↔V86: targets 27.4/6.9Å but partners are 36.0Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=33 · 3-10(G)=19 · coil(C)=10

```
CHGEGGEECEEGGEHHEHGHHHHHHHHHHHHHHEGEECEEEHHGEGEEEGEECGHHHHHHHHHHGEEEEHGEGCHEGECEHCEGEGECHEGECEGC
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=18 · sheet=32
  - V16 ↔ F20  (helix)
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - R22 ↔ Q26  (helix)
  - K23 ↔ A27  (helix)
  - Y24 ↔ E28  (helix)
  - T25 ↔ G29  (helix)
  - Q26 ↔ K30  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - S55 ↔ H59  (helix)
  - K56 ↔ M60  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - E11 ↔ Q17  (sheet)
  - L34 ↔ G48  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=45 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=384 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=211 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9247 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2ACY.ensemble.pdb`)
- RMSF mean=0.022Å max=0.059Å (per-residue in .per_residue.csv)
- most flexible residues: 93, 8, 13, 14, 35

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2ACY.pae.csv`
- mean=0.016Å · max=0.096Å · AlphaFold-PAE analog (low block = rigid unit/domain)
