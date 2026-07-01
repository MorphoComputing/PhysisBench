# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1UBQ\seeds\seed_0\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.676 A
- tm_score_ca_ordered: 0.9614693291150058
- heavy_atom_rmsd: 2.530 A
- sidechain_heavy_atom_rmsd: 3.311 A
- **all-atom quality (honest):** heavy 2.530 A, sidechain 3.311 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2556
- bin_accuracy: 0.929

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6764015434061595
- ga_delta_rmsd: 0.00583148283960877  ga_fitness_mode: energy
- pre_local_rmsd: 0.6782882455946457  localized_anchor_rmsd: 0.6764145564108056

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.014), conflicts/hub=1.0, max_incompat=1.53Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q1** — severity 0.64, 1 conflict(s); suspect input ~`K62` (group: pull_in)
  - pull-in (wants closer): G74@27.5Å(now 33.3,conf 0.99), R73@27.3Å(now 30.2,conf 0.93)
  - G74↔K62: targets 27.5/5.8Å but partners are 34.9Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=23 · 3-10(G)=18 · coil(C)=6

```
EEEGEEHHGEEGEGGEEHHEGHHHHHHHHHHGCGEGHHHEGGCEHHEGEEGHEEHHHGHHEHHEEGECGGCCGC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=11 · sheet=31
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
  - Q1 ↔ D20  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ T13  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=247 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0505 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1UBQ.ensemble.pdb`)
- RMSF mean=0.023Å max=0.053Å (per-residue in .per_residue.csv)
- most flexible residues: 36, 12, 17, 4, 7

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1UBQ.pae.csv`
- mean=0.016Å · max=0.079Å · AlphaFold-PAE analog (low block = rigid unit/domain)
