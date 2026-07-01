# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.089 A
- tm_score_ca_ordered: 0.8802530011503981
- heavy_atom_rmsd: 3.095 A
- sidechain_heavy_atom_rmsd: 3.972 A
- **all-atom quality (honest):** heavy 3.095 A, sidechain 3.972 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.844

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=1.2410763317856002 -> 0.920847100124912 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0892271614167242
- ga_delta_rmsd: -0.3325944691343806  ga_fitness_mode: energy
- pre_local_rmsd: 1.18613640670159  localized_anchor_rmsd: 1.0892281075039363

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.036), conflicts/hub=1.0, max_incompat=2.48Å, chain_span=0.018
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A55** — severity 0.84, 1 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): T1@15.8Å(now 11.9,conf 0.34)
  - T1↔D2: targets 15.8/12.1Å but partners are 1.3Å apart → too_close_together by 2.5Å
- **P56** — severity 0.82, 1 conflict(s); suspect input ~`D2` (group: push_out)
  - pull-in (wants closer): R14@27.5Å(now 30.5,conf 0.98), C13@27.4Å(now 30.7,conf 0.97)
  - push-out (wants farther): T1@17.2Å(now 13.1,conf 0.35)
  - T1↔D2: targets 17.2/13.5Å but partners are 1.3Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=25 · 3-10(G)=12 · coil(C)=5

```
EEHHHEECEGEGEGECECEEECGHHGHEGEEECGGGEEEEHHEGGEHHHHHHGEEE
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=2 · sheet=43
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ P7  (sheet)
  - D2 ↔ P7  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ K19  (sheet)
  - D15 ↔ F32  (sheet)
  - I17 ↔ R31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - K19 ↔ A30  (sheet)
  - K19 ↔ R31  (sheet)
  - K19 ↔ F32  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0892 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
