# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1UBQ/sequence/1UBQ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1UBQ/seeds/seed_1/1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.070 A
- tm_score_ca_ordered: 0.9994692597971276
- heavy_atom_rmsd: 2.720 A
- sidechain_heavy_atom_rmsd: 3.608 A
- **all-atom quality (honest):** heavy 2.720 A, sidechain 3.608 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2556
- bin_accuracy: 0.976

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.07020985625694802
- ga_delta_rmsd: 0.0051497319391503454  ga_fitness_mode: energy
- pre_local_rmsd: 0.07059927667375301  localized_anchor_rmsd: 0.07020918099043914

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.027), conflicts/hub=1.5, max_incompat=2.04Å, chain_span=0.014
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I2** — severity 1.96, 2 conflict(s); suspect input ~`K62` (group: pull_in)
  - pull-in (wants closer): G74@27.5Å(now 30.3,conf 1.00)
  - G74↔K62: targets 27.5/6.0Å but partners are 35.4Å apart → too_far_apart by 1.8Å
  - G74↔E63: targets 27.5/4.8Å but partners are 33.9Å apart → too_far_apart by 1.6Å
- **Q1** — severity 1.13, 1 conflict(s); suspect input ~`K62` (group: pull_in)
  - pull-in (wants closer): G74@27.5Å(now 33.3,conf 1.00), R73@27.5Å(now 30.2,conf 1.00)
  - G74↔K62: targets 27.5/5.8Å but partners are 35.4Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=24 · 3-10(G)=20 · coil(C)=4

```
EEEGGGHHGEEGEGCEEHHEEHHHHHHHHHHECGEGHHHEGGCEHHEGGEGHEEHHHGHEGHHEEGEGGEGGCE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=11 · sheet=26
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - G52 ↔ S56  (helix)
  - L55 ↔ N59  (helix)
  - N59 ↔ E63  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ T13  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ E17  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ T13  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - I2 ↔ D20  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=108 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6423 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
