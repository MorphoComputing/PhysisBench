# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2ACY\seeds\seed_0\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.130 A
- tm_score_ca_ordered: 0.9986771062814643
- heavy_atom_rmsd: 2.725 A
- sidechain_heavy_atom_rmsd: 3.571 A
- **all-atom quality (honest):** heavy 2.725 A, sidechain 3.571 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2186
- bin_accuracy: 0.970

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.22197881928392665 -> 0.2209533374672029 A
- topology_reconvergence: applied=True accepted=27/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.1299648953014176
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.13090159027965412  localized_anchor_rmsd: 0.12997843096570894

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** D3-L5 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.021), conflicts/hub=1.5, max_incompat=2.29Å, chain_span=0.5
- **fix-first:** [LOW_CONFLICT] Root cause(s): D3-L5 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L5** — severity 2.11, 2 conflict(s); suspect input ~`V86` (group: pull_in)
  - pull-in (wants closer): G18@27.5Å(now 31.7,conf 1.00), K71@27.5Å(now 31.1,conf 1.00)
  - K71↔V86: targets 27.5/6.5Å but partners are 36.2Å apart → too_far_apart by 2.2Å
  - G18↔V86: targets 27.5/6.5Å but partners are 35.6Å apart → too_far_apart by 1.6Å
- **P53** — severity 1.33, 1 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): D42@27.5Å(now 30.2,conf 1.00)
  - D42↔D3: targets 27.5/4.9Å but partners are 34.7Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=32 · 3-10(G)=18 · coil(C)=12

```
EECEGECEEEEGGEHCEHGHHHHHHHHHHHHHHEGEECECEHHHECEEEGEECGHHHHHHHHHHGCEECHHEGHHEEECEHCEGGGEGGEGEGGGC
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=18 · sheet=27
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
  - K71 ↔ D75  (helix)
  - E1 ↔ I6  (sheet)
  - E11 ↔ Q17  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=46 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=382 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=209 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.576 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
